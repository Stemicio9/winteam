import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/dashboard_tab_index_bloc/tab_index_bloc.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/enums.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/ads_published_dialog.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_chips.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_date.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_description.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_position.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_price.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_skill.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/publish_button.dart';
import 'package:winteam/utils/ad_status_utils.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class CreateAdsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SkillCubit(), child: CreateAds());
  }
}

class CreateAds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateAdsState();
  }
}

class CreateAdsState extends State<CreateAds> {
  SkillCubit get _skillCubit => context.read<SkillCubit>();
  TabIndexCubit get _tabIndexCubit => context.read<TabIndexCubit>();
  SubscriptionCubit get _subscriptionCubit => context.read<SubscriptionCubit>();
  AnnunciCubit get _annunciCubit => context.read<AnnunciCubit>();

  final TextEditingController filterController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<bool> indexes = [false, false, false, false];
  List<String> texts = ['Mattina', 'Pomeriggio', 'Sera', 'Notte'];
  SkillEntity skillSelected = SkillEntity();
  DateTime dateSelected = DateTime.now();

  @override
  void initState() {
    super.initState();
    _skillCubit.getSkillList();
    _subscriptionCubit.cani(SubscriptionRequests.createAdvertisement.name);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: getPadding(bottom: 35),
            child: BlocBuilder<SubscriptionCubit, SubscriptionState>(builder: (_, state){
              if(state is SubscriptionLoading){
                return Center(child: loadingGif());
              }else if(state is SubscriptionCanI){
                return adsCreateForm();
              }else if(state is SubscriptionCannotI){
                return adsCreateForm();
                //return const CannotCreateAdsWidget();
              }else{
                return const Center(child: Text('Errore'));
              }
            },
            )
          ),
        );
  }


  Widget adsCreateForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<SkillCubit, SkillState>(builder: (_, state) {
          if (state is SkillListLoading) {
            return Center(child: loadingGif());
          } else if (state is SkillListLoaded) {
            return CreateAdsSkill(
              filterController: filterController,
              optionSelected: onSelectedAutocomplete,
              kOptions: state.skillList,
            );
          } else {
            return const Center(child: Text('Error'));
          }
        }),
        CreateAdsPrice(
            priceController: priceController,
            priceValidator: (value) {
              if (value.isEmpty ||
                  !RegExp(r'^[0-9]+$').hasMatch(value)) {
                return 'Please enter valid price';
              }
              if (int.parse(value) < 0) {
                return 'Price must be greater than 0';
              }
              return null;
            }),
        CreateAdsPosition(
          positionController: positionController,
        ),
        CreateAdsDate(
          fromDateController: fromDateController,
          toDateController: toDateController,
          fromDateOnChanged: (date) {
            print('change $date');
          },
          fromDateOnConfirm: (date) {
            fromDateController.text =  AdStatusUtils.formatDate(date);
            dateSelected = date;
            print('confirm $date');
          },
          toDateOnChanged: (date) {
            print('change $date');
          },
          toDateOnConfirm: (date) {
            toDateController.text =  AdStatusUtils.formatDate(date);
            print('confirm $date');
          },
          fromDateMaxTime: toDateController.text == ''
              ? DateTime.now().add(const Duration(days: 365))
              : DateTime.now().add(const Duration(days: 365)),
          fromDateMinTime: DateTime.now(),
          toDateMaxTime: DateTime.now().add(const Duration(days: 365)),
          toDateMinTime: DateTime.now(),
        ),
        CreateAdsChips(
          valueSelected: selectElement,
          indexes: indexes,
          texts: texts,
        ),
        CreateAdsDescription(
          descriptionController: descriptionController,
        ),
        PublishButton(onTap: () {
          AnnunciEntity a = composeAd();
          _annunciCubit.publishAnnuncio(a);
          showDialog(
              context: context,
              barrierColor: blackDialog,
              builder: (ctx) => AdsPublishedDialog(
                onTap: () {
                  _tabIndexCubit.setTabIndex(0); //set tab index to dashboard
                  Navigator.pushNamed(context, RouteConstants.dashboard);
                },
              ));
        })
      ],
    );
  }

  void onSelectedAutocomplete(SkillEntity value) {
    print("Selected value ${value.name}");
    skillSelected = value;
    setState(() {
      filterController.text = value.name;
    });
  }

  void selectElement(int index, bool value) {
    indexes = [false, false, false, false];
    setState(() {
      indexes[index] = value;
    });
  }

  AnnunciEntity composeAd() {
    AnnunciEntity result = AnnunciEntity.defaultVal();
    String hourSlot = formatHourSlot();
    print(" skillSelected name: ${skillSelected.name}");
    print(" skillSelected id: ${skillSelected.id}");
    result = result.copyWith(
        description: descriptionController.text,
        position: positionController.text,
        payment: priceController.text,
        skill: skillSelected,
        date: dateSelected,
        hourSlot: hourSlot);
    return result;
  }

  String formatHourSlot() {
    for (int i = 0; i < indexes.length; i++) {
      if (indexes[i]) {
        return texts[i];
      }
    }
    return '';
  }
}

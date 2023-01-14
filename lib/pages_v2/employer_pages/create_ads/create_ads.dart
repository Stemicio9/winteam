import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/ads_published_dialog.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_date.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_description.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_chips.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_position.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_price.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/create_ads_skill.dart';
import 'package:winteam/pages_v2/employer_pages/create_ads/widget/publish_button.dart';
import 'package:winteam/utils/size_utils.dart';

class CreateAds extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CreateAdsState();
  }

}



class CreateAdsState extends State<CreateAds>{

  final TextEditingController filterController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<bool> indexes = [false, false, false, false];
  List<String> texts = ['Mattina', 'Pomeriggio', 'Sera', 'Notte'];

  final format = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: getPadding(bottom: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                CreateAdsSkill(
                  filterController: filterController,
                  optionSelected: onSelectedAutocomplete,



                ),

                CreateAdsPrice(
                  priceController: priceController,
                ),

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
                    fromDateController.text = format.format(date);
                    print('confirm $date');
                  },
                  toDateOnChanged: (date) {
                    print('change $date');
                  },
                  toDateOnConfirm: (date) {
                    toDateController.text = format.format(date) ;
                    print('confirm $date');
                  },

                  fromDateMaxTime: toDateController.text == '' ?
                  DateTime.now().add(const Duration(days: 365)) :
                  DateTime.now().add(const Duration(days: 365)),

                  fromDateMinTime:  DateTime.now(),

                  toDateMaxTime:  DateTime.now().add(const Duration(days: 365)),
                  toDateMinTime:  DateTime.now(),
                ),


                CreateAdsChips(
                  valueSelected: selectElement,
                  indexes: indexes,
                  texts: texts,

                ),

                CreateAdsDescription(
                  descriptionController: descriptionController,
                ),

                PublishButton(
                    onTap: (){
                      showDialog(
                          context: context,
                          barrierColor: blackDialog,
                          builder: (ctx) => AdsPublishedDialog(
                            onTap: (){Navigator.pushNamed(context, RouteConstants.dashboard);},
                          ));
                    }
                )
              ],
            ),
          ),


    );
  }



  void onSelectedAutocomplete(SkillEntity value){
    print("Selected value ${value.name}");
  }

  void selectElement(int index, bool value) {
    indexes = [false, false, false, false];
    setState(() {
      indexes[index] = value;
    });

  }

}
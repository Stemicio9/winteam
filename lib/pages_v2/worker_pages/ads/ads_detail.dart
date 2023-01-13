import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_description.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_footer.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_info.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_skill.dart';
import 'package:winteam/utils/ad_status_utils.dart';
import 'package:winteam/utils/size_utils.dart';

class AdsDetail extends StatefulWidget {
  final bool isEmployer;

  AdsDetail({this.isEmployer = false});

  @override
  State<StatefulWidget> createState() {
    return AdsDetailState();
  }
}

class AdsDetailState extends State<AdsDetail> {
  AnnunciUserListCubit get _annunciCubit =>
      context.read<AnnunciUserListCubit>();
  UserAuthCubit get _authCubit =>
      context.read<UserAuthCubit>();

  final message = 'Valutazione: 4/5';
  final rating = 4.00;
  final stateMessage = 'Status annuncio: ';
  final subtitle = 'Azienda srl';
  final image = 'assets/images/img_pexelsphotoby.png';

  String statusLabel = '';
  String candidateNumber = '0';
  Color statusColor = Colors.transparent;

  late AnnunciEntity annuncio;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    AnnunciEntity annuncio = arguments['annuncio'];
    formatStatusLabel(annuncio);
    _annunciCubit.listCandidati(annuncio);
   return content(annuncio);
  }


  Widget content(AnnunciEntity annuncio) {
    return W1nScaffold(
        appBar: 1,
        title: ANNUNCIO,
        body: SingleChildScrollView(
            child: Padding(
              padding: getPadding(bottom: 35),
              child: Column(
                children: [
                  AdsDetailSkill(
                    skillIcon: annuncio.skillDTO?.imageLink ?? '',
                    skillName: annuncio.skillDTO?.name ?? 'TEST NAME',
                    price: annuncio.payment,
                    message: stateMessage,
                    state: statusLabel,
                    statusColor: statusColor,
                    isVisible: widget.isEmployer,
                  ),
                  AdsDetailInfo(
                    isVisible: !widget.isEmployer,
                    message: message,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RouteConstants.employerProfileOnlyView,
                          arguments: {'company': annuncio.publisherUserDTO});
                    },
                    image: image,
                    subtitle: annuncio.publisherUserDTO?.companyName ?? '',
                    position: annuncio.position,
                    date: annuncio.date,
                    hours: annuncio.hourSlot,
                    rating: annuncio.publisherUserDTO?.rating ?? 0,
                  ),
                  AdsDetailDescription(
                    description: annuncio.description,
                  ),
                  bottomButtonSection(annuncio)
                ],
              ),
            )));
  }

  Widget bottomButtonSection(AnnunciEntity annuncio){
    return BlocBuilder<AnnunciUserListCubit,AnnunciUserListState>(
        builder: (_, state){
          if(state is AnnunciUserListLoading){
            return const Center(child: CircularProgressIndicator());
          } else if(state is AnnunciUserListLoaded){

            return BlocBuilder<UserAuthCubit,UserAuthenticationState>(
                builder: (_ ,innerState){
                  if(innerState is UserAuthenticated){
                    bool isApplicant = state.utenti.any((element) => element.id ==  innerState.user.id);
                    return bottomButton(annuncio, isApplicant);
                  }else{
                    return Container(
                      child: const Center(
                        child: Text("C'è un problema con l'autenticazione"),
                      )
                    );
                  }
                }
            );
          } else {
            return const Center(child: Text('Error'));
          }
        }
    );
  }


  Widget bottomButton(AnnunciEntity annuncio, bool isApplicant){
    return AdsDetailFooter(
      goToList: () {
        Navigator.pushNamed(context, RouteConstants.candidatesList);
      },
      viewApplies: VIEW_APPLIES,
      isVisible: widget.isEmployer,
      text: APPLY,
      cancelButtonText: CANCEL_APPLICATION,
      candidates: candidateNumber,
      isApplicant: isApplicant,
      cancelApplication: () {
        showDialog(
            context: context,
            barrierColor: blackDialog,
            builder: (ctx) => AdsDetailDialog(
              isApplicantDialog: isApplicant,
              confirmOnTap: () {
                _annunciCubit.candidate(annuncio.id ?? "");
                Navigator.pop(context);
              },
            ));
      },
      onTap: () {
        _annunciCubit.candidate(annuncio.id ?? '');
        showDialog(
            context: context,
            barrierColor: blackDialog,
            builder: (ctx) => AdsDetailDialog(
              isApplicantDialog: isApplicant,
            ));
        setState(() {
          _annunciCubit.candidate(annuncio.id ?? "");
        });
      },
    );
  }

  void formatStatusLabel(annuncio) {
    if(widget.isEmployer){
      statusLabel = AdStatusUtils.getAdStatus(annuncio.advertisementStatus);
      statusColor = AdStatusUtils.getAdStatusColor(annuncio.advertisementStatus);
    } else {
    }
    candidateNumber = annuncio.candidateUserList.length.toString();
  }
}

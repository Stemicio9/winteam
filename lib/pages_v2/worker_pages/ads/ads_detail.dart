import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_description.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_footer.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_info.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_skill.dart';
import 'package:winteam/utils/image_constant.dart';
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
  final candidates = '0';
  final message = 'Valutazione: 4/5';
  final rating = 4.00;
  final pizzaiolo = 'Pizzaiolo';
  final price = '70';
  final stateMessage = 'Status annuncio: ';
  final state = 'Attivo';
  final subtitle = 'Azienda srl';
  final hours = 'Mattina';
  final date = '24/12/2022';
  final position = 'Cosenza';
  final image = 'assets/images/img_pexelsphotoby.png';
  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';
  late bool isApplicant = false;
  late bool isApplicantDialog = false;

  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        appBar: 1,
        title: ANNUNCIO,
        body: SingleChildScrollView(
            child: Padding(
          padding: getPadding(bottom: 35),
          child: Column(
            children: [
              AdsDetailSkill(
                skillIcon: ImageConstant.imgPizza,
                skillName: pizzaiolo,
                price: price,
                message: stateMessage,
                state: state,
                isVisible: widget.isEmployer,
              ),
              AdsDetailInfo(
                isVisible: !widget.isEmployer,
                message: message,
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteConstants.employerProfileOnlyView);
                },
                image: image,
                subtitle: subtitle,
                position: position,
                date: date,
                hours: hours,
                rating: rating,
              ),
              AdsDetailDescription(
                description: description,
              ),
              AdsDetailFooter(
                goToList: () {
                  Navigator.pushNamed(context, RouteConstants.candidatesList);
                },
                viewApplies: VIEW_APPLIES,
                isVisible: widget.isEmployer,
                text: APPLY,
                cancelButtonText: CANCEL_APPLICATION,
                candidates: candidates,
                isApplicant: isApplicant,
                cancelApplication: () {
                  showDialog(
                      context: context,
                      barrierColor: blackDialog,
                      builder: (ctx) => AdsDetailDialog(
                            isApplicantDialog: !isApplicantDialog,
                            confirmOnTap: () {
                              Navigator.pop(context);
                              setState(() {
                                isApplicant = false;
                              });
                            },
                          ));
                },
                onTap: () {
                  showDialog(
                      context: context,
                      barrierColor: blackDialog,
                      builder: (ctx) => AdsDetailDialog(
                            isApplicantDialog: isApplicantDialog,
                          ));
                  setState(() {
                    isApplicant = true;
                  });
                },
              ),
            ],
          ),
        )));
  }
}

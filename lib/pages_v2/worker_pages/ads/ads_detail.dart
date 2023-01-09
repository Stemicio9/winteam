import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_description.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_dialog.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_footer.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_info.dart';
import 'package:winteam/pages_v2/worker_pages/ads/widgets/ads_detail_skill.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';

class AdsDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdsDetailState();
  }
}

class AdsDetailState extends State<AdsDetail> {
  final candidates = '3';
  final message = 'Valutazione: 4/5';
  final rating = 4.00;
  final pizzaiolo = 'Pizzaiolo';
  final price = '70';
  final subtitle = 'Azienda srl';
  final hours = 'Mattina';
  final date = '24/12/2022';
  final position = 'Cosenza';
  final image = 'assets/images/img_pexelsphotoby.png';
  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices ';

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
              ),
              AdsDetailInfo(
                message: message,
                onTap: () {},
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
                text: APPLY,
                candidates: candidates,
                onTap: () {
                  showDialog(
                      context: context,
                      barrierColor: blackDialog,
                      builder: (ctx) => AdsDetailDialog()
                  );
                },

              ),
            ],
          ),
        )));
  }
}

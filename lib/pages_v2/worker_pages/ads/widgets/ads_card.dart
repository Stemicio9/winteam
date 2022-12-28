import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/ads/data/annuncio.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class AdsCard extends StatelessWidget {
  final double innerImageRadius; // 77
  final double innerImageWidth; // 90
  final double innerImageHeight; // 90
  final double imageWidth; // 90
  final double imageHeight; // 90
  final onTap;
  final String position;
  final String date;
  final String hours;
  final String title;
  final String subtitle;
  final String price;
  final skillIcon;
  final image;




  AdsCard(
      {this.innerImageRadius = 77,
      this.imageWidth = 90,
      this.imageHeight = 90,
      this.innerImageWidth = 90,
      this.innerImageHeight = 90,
      required this.onTap,
        this.title ='Pizzaiolo',
        this.subtitle ='Azienda srl',
        this.hours ='18:00 - 01:00',
        this.price ='70',
        this.date ='24/12/2022',
        this.position ='Cosenza',
        this.skillIcon,
        this.image,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: 20, left: 16, right: 16),
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: Padding(
            padding: getPadding(top: 24, bottom: 24, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: getPadding(right: 20),
                            child: Container(
                              height: getSize(
                                imageHeight,
                              ),
                              width: getSize(
                                imageWidth,
                              ),
                              child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CustomImageView(
                                      imagePath: image,
                                      height: getSize(
                                        innerImageHeight,
                                      ),
                                      width: getSize(
                                        innerImageWidth,
                                      ),
                                      radius: BorderRadius.circular(
                                        getHorizontalSize(
                                          innerImageRadius,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                    ),
                                  ]),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  title,
                                  style: AppStyle.txtMontserratBold24,
                                ),
                                Padding(
                                  padding:getPadding(left: 5),
                                  child: CustomImageView(
                                    svgPath: skillIcon,
                                    height: getSize(
                                      20,
                                    ),
                                    width: getSize(
                                      20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              subtitle,
                              style: AppStyle.txtMontserratRegularUnderline20,
                            ),
                            Padding(
                              padding: getPadding(top: 15),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: getPadding(right: 10),
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgMapsandflags,
                                      height: getSize(
                                        20,
                                      ),
                                      width: getSize(
                                        20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    position,
                                    style: AppStyle.txtMontserratRegular18,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(top: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: getPadding(right: 10),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgCalendar,
                                      height: getSize(
                                        20,
                                      ),
                                      width: getSize(
                                        20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    date,
                                    style: AppStyle.txtMontserratRegular18,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(top: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: getPadding(right: 10),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgHours,
                                      height: getSize(
                                        20,
                                      ),
                                      width: getSize(
                                        20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    hours,
                                    style: AppStyle.txtMontserratRegular18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgPayment,
                            height: getSize(
                              45,
                            ),
                            width: getSize(
                              45,
                            ),
                          ),
                          Padding(
                            padding: getPadding(left: 10),
                            child: Text(
                              '$price €',
                              style: AppStyle.txtMontserratBold22,
                            ),
                          )
                        ],
                      ),
                      ActionButtonV2(
                        action: onTap,
                        text: APPLY,
                        color: background,
                        maxWidth: 200,
                        textColor: white,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

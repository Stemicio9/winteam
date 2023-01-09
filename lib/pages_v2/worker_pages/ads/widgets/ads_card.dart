import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/tooltip_widget.dart';

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
  final String candidates;
  final String message;
  final skillIcon;
  final image;
  final bool isVisible;
  final goToList;


  AdsCard({
    this.innerImageRadius = 77,
    this.imageWidth = 90,
    this.imageHeight = 90,
    this.innerImageWidth = 90,
    this.innerImageHeight = 90,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.hours,
    required this.price,
    required this.date,
    required this.position,
    required this.skillIcon,
    required this.image,
    this.message ='',
    this.candidates = '',
    this.isVisible = true,
    this.goToList,
  });

  @override
  Widget build(BuildContext context) {

    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

    return Padding(
      padding: getPadding(bottom: 20, left: 15, right: 15),
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
                                      onTap: () {},
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
                                  padding: getPadding(left: 5),
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
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                subtitle,
                                style: AppStyle.txtMontserratRegularUnderline20,
                              ),
                            ),
                            Padding(
                              padding: getPadding(top: 15),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: getPadding(right: 12),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgPosition,
                                      height: getSize(
                                        24,
                                      ),
                                      width: getSize(
                                        18,
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


              isVisible ?  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TooltipWidget(
                            message: message,
                            direction: AxisDirection.left,
                            child: Material(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                width: 17,
                                height: 17,
                                decoration: BoxDecoration(
                                  color: lightGreen,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                        ),

                        Padding(
                          padding: getPadding(top: 25),
                          child: GestureDetector(
                            onTap: goToList,
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgPeople,
                                  height: 18,
                                  width: 18,
                                ),

                                Padding(
                                  padding:  getPadding(left: 5),
                                  child: Text(
                                    candidates,
                                    style: AppStyle.txtMontserratRegular16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ) : Container()

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
                        text: DETAILS,
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

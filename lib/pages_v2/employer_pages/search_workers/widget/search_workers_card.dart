import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

import '../../../../theme/app_style.dart';
import '../../../../utils/size_utils.dart';

class SearchWorkerCard extends StatelessWidget {
  final double innerImageRadius; // 77
  final double innerImageWidth; // 90
  final double innerImageHeight; // 90
  final double imageWidth; // 90
  final double imageHeight; // 90
  final Function? onTap;
  final Function? view;
  final Function? choose;

  final String phone;
  final String email;
  final String position;
  final String title;
  final String subtitle;
  final skillIcon;
  final image;
  final bool isSearch;
  final bool isCandidatesList;

  SearchWorkerCard({
    this.innerImageRadius = 77,
    this.imageWidth = 90,
    this.imageHeight = 90,
    this.innerImageWidth = 90,
    this.innerImageHeight = 90,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.email,
    required this.position,
    required this.phone,
    required this.skillIcon,
    required this.image,
    this.choose,
    this.view,
    this.isSearch = true,
    this.isCandidatesList = false,
  });

  @override
  Widget build(BuildContext context) {
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
                          Text(
                            title,
                            style: AppStyle.txtMontserratBoldBlue24,
                          ),
                          Row(
                            children: [
                              Text(
                                subtitle,
                                style: AppStyle.txtMontserratSemiBoldBlack20,
                              ),
                              Padding(
                                padding: getPadding(left: 5),
                                child: CustomImageView(
                                  svgPath: skillIcon,
                                  height: getSize(
                                    15,
                                  ),
                                  width: getSize(
                                    15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: getPadding(top: 15),
                            child: Row(
                              children: [
                                Padding(
                                  padding: getPadding(right: 10),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgPhoneSvg,
                                    height: getSize(
                                      19,
                                    ),
                                    width: getSize(
                                      18,
                                    ),
                                  ),
                                ),
                                Text(
                                  phone,
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
                                    svgPath: ImageConstant.imgEmailSvg,
                                    height: getSize(
                                      14,
                                    ),
                                    width: getSize(
                                      20,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 205,
                                  child: Text(
                                    email,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyle.txtMontserratRegular18,
                                  ),
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
                                    svgPath: ImageConstant.imgPosition,
                                    height: getSize(
                                      22,
                                    ),
                                    width: getSize(
                                      16,
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


                       isSearch ? Padding(
                            padding: getPadding(top: 25),
                            child: ActionButtonV2(
                              action: onTap,
                              text: VIEW_PROFILE,
                              color: background,
                              maxWidth: 230,
                              textColor: white,
                            ),
                          ) :Container()
                        ] ,
                      ),
                    ],
                  ),
                ],
              ),


             isCandidatesList ? Padding(
               padding: getPadding(top: 25),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   ActionButtonV2(
                       action: view,
                       text: VIEW,
                       color: background,
                       maxWidth: 150,
                       textColor: white
                   ),

                   ActionButtonV2(
                       action:choose,
                       text: CHOOSE,
                       color: green,
                       maxWidth: 150,
                       textColor: white,
                       isVisible: true,
                       imgPath: ImageConstant.imgAssumi,
                       iconWidth: 30,
                       iconHeight: 30,


                   ),
                 ],

                ),
             ): Container()
            ],
          ),
        ),
      ),
    );
  }
}

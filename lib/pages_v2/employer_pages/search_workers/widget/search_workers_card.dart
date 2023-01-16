import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/pages_v2/employer_pages/ads/widget/button_choose.dart';
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
  final onTap;
  final Function? view;
  final Function? choose;

  final UserEntity? user;
  final skillIcon;
  final bool isSearch;
  final bool isSelected;
  final bool isCandidatesList;

  final bool isChoosenUser;

  SearchWorkerCard(
      {this.innerImageRadius = 77,
      this.imageWidth = 90,
      this.imageHeight = 90,
      this.innerImageWidth = 90,
      this.innerImageHeight = 90,
      this.onTap,
      required this.skillIcon,
      this.user,
      this.choose,
      this.view,
      this.isSearch = true,
      this.isCandidatesList = false,
      this.isSelected = false,
      this.isChoosenUser = false});

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
              Visibility(
                  visible: isChoosenUser,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    // ,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(right: 20),
                          child: SizedBox(
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
                                    onTap: onTap,
                                    imagePath: user?.imageLink ?? ImageConstant.placeholderUserUrl,
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.53,
                            child: Text(
                              '${user?.firstName} ${user?.lastName}',
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.txtMontserratBoldBlue24,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.49,
                                child:  Text(
                                  user?.brief ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.txtMontserratSemiBoldBlack20,
                                ),
                              )
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
                                  user?.phoneNumber ?? '',
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
                                      18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    user?.email ?? '',
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
                                      23,
                                    ),
                                    width: getSize(
                                      18,
                                    ),
                                  ),
                                ),
                                Text(
                                  user?.address ?? '',
                                  style: AppStyle.txtMontserratRegular18,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                              visible: isSearch,
                              child: Padding(
                                padding: getPadding(top: 25),
                                child: ActionButtonV2(
                                  action: onTap,
                                  text: VIEW_PROFILE,
                                  color: background,
                                  maxWidth: 230,
                                  textColor: white,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Visibility(
                  visible: isCandidatesList,
                  child: Padding(
                      padding: getPadding(top: 25),
                      child: Row(
                        mainAxisAlignment: !isSelected ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                        children: [
                          ActionButtonV2(
                              action: view,
                              text: VIEW,
                              color: background,
                              maxWidth: 150,
                              textColor: white),
                           Visibility(
                             visible: !isSelected,
                             child: ButtonChoose(
                                    choose: choose,
                                    maxWidth: 150,
                                  ),
                           ),
                        ],
                      ))),
              Visibility(
                  visible: isChoosenUser,
                  child: Padding(
                      padding: getPadding(top: 25),
                      child: Center(
                          child: ActionButtonV2(
                              action: view,
                              text: VIEW,
                              color: background,
                              maxWidth: 150,
                              textColor: white),
                      )


                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_decoration.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/color_constant.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class ImageProfile extends StatelessWidget {
  final double topColorHeight; // 150
  final double topMargin; // 65
  final double borderSize; // 7
  final double imageWidth; // 166
  final double imageHeight; // 166
  final double innerImageWidth; // 154
  final double innerImageHeight; // 154
  final double innerImageRadius; // 77
  final double iconWidth; // 34
  final double iconHeight; // 34
  final Function(String)? openCamera;
  final Function(String)? openGallery;
  final String urlImage;
  final String userId;

  const ImageProfile({
    Key? key,
    this.topColorHeight = 150,
    this.topMargin = 65,
    this.borderSize = 7,
    this.imageHeight = 166,
    this.imageWidth = 166,
    this.innerImageHeight = 154,
    this.innerImageWidth = 154,
    this.innerImageRadius = 77,
    this.iconWidth = 34,
    this.iconHeight = 34,
    this.openCamera,
    this.openGallery,
    this.urlImage = "",
    this.userId = ""
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: getVerticalSize(
                      topColorHeight,
                    ),
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: background,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 0,
                    margin: getMargin(
                      top: topMargin,
                    ),
                    color: ColorConstant.blueGray100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          innerImageRadius,
                        ),
                      ),
                    ),
                    child: Container(
                      height: getSize(
                        imageHeight,
                      ),
                      width: getSize(
                        imageWidth,
                      ),
                      decoration: AppDecoration.outlineWhiteA700.copyWith(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            innerImageRadius,
                          ),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CustomImageView(
                            url: urlImage,
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
                            placeHolder: ImageConstant.placeholderUserUrl,
                          ),
                          Visibility(
                              visible: openCamera != null,
                              child: ExpandTapWidget(
                                onTap: () {
                                  print("premuto");
                                  showDialog(
                                      context: context,
                                      barrierColor: blackDialog,
                                      builder: (ctx) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    openGallery?.call(userId);
                                                  },
                                                  child: Card(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      elevation: 0,
                                                      margin: EdgeInsets.all(0),
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .circleBorder70),
                                                      child: Container(
                                                          height:
                                                              getSize(140.00),
                                                          width:
                                                              getSize(140.00),
                                                          padding: getPadding(
                                                              all: 44),
                                                          decoration: AppDecoration
                                                              .outlineWhiteA70021
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder70),
                                                          child:
                                                              Stack(children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgVector,
                                                                height: getSize(
                                                                    40.00),
                                                                width: getSize(
                                                                    40.00),
                                                                alignment:
                                                                    Alignment
                                                                        .center),
                                                          ]))),
                                                ),
                                                Padding(
                                                    padding:
                                                        getPadding(top: 33),
                                                    child: Text(GALLERY,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratMedium20)),
                                                GestureDetector(
                                                  onTap: () {
                                                    openCamera?.call(userId);
                                                  },
                                                  child: Card(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      elevation: 0,
                                                      margin:
                                                          getMargin(top: 107),
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .circleBorder70),
                                                      child: Container(
                                                          height:
                                                              getSize(140.00),
                                                          width:
                                                              getSize(140.00),
                                                          padding: getPadding(
                                                              left: 44,
                                                              top: 47,
                                                              right: 44,
                                                              bottom: 47),
                                                          decoration: AppDecoration
                                                              .outlineWhiteA70021
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder70),
                                                          child:
                                                              Stack(children: [
                                                            CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgCamera,
                                                              height:
                                                                  getVerticalSize(
                                                                      40.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      40.00),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                            )
                                                          ]))),
                                                ),
                                                Padding(
                                                    padding: getPadding(
                                                      top: 32,
                                                    ),
                                                    child: Text(CAMERA,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtMontserratMedium20))
                                              ]));
                                },
                                tapPadding: const EdgeInsets.all(150.0),
                                child: CustomImageView(
                                  radius: BorderRadius.circular(50),
                                  svgPath: ImageConstant.imgSettings,
                                  height: getSize(
                                    iconHeight,
                                  ),
                                  width: getSize(
                                    iconWidth,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

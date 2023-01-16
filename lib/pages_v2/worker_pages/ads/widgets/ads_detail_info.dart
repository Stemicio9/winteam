import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/divider_v2.dart';
import 'package:winteam/widgets_v2/tooltip_widget.dart';

class AdsDetailInfo extends StatelessWidget {
  final double innerImageRadius; // 77
  final double innerImageWidth; // 90
  final double innerImageHeight; // 90
  final double imageWidth; // 90
  final double imageHeight; // 90
  final double rating; // 90

  final onTap;
  final String position;
  final String date;
  final String hours;
  final String subtitle;
  final image;
  final String message;
  final bool isVisible;

  AdsDetailInfo({
    this.innerImageRadius = 77,
    this.imageWidth = 110,
    this.imageHeight = 110,
    this.innerImageWidth = 110,
    this.innerImageHeight = 110,
    required this.onTap,
    required this.subtitle,
    required this.hours,
    required this.date,
    required this.position,
    required this.image,
    required this.rating,
    required this.message,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 30, right: 35, left: 35),
      child: Column(
        children: [
          isVisible ?   Padding(
            padding:getPadding(bottom: 30),
            child: Row(
              children: [
                Padding(
                    padding: getPadding(right: 10),
                    child: Container(
                      height: getSize(
                        imageHeight,
                      ),
                      width: getSize(
                        imageWidth,
                      ),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        CustomImageView(
                          onTap: onTap,
                          url: image,
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
                    )
                ),
               GestureDetector(
                  onTap: onTap,
                  child: Column(
                    children: [
                      Padding(
                        padding: getPadding(bottom: 5),
                        child: Text(
                          subtitle,
                          style: AppStyle.txtMontserratBoldUnderline24,
                        ),
                      ),
                      TooltipWidget(
                        message: message,
                        direction: AxisDirection.down,
                        child: RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: rating,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 19,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star_rounded,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ) : Container(),


            Row(
              children: [
                Padding(
                  padding: getPadding(right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgPosition,
                    height: getSize(
                      25,
                    ),
                    width: getSize(
                      19,
                    ),
                  ),
                ),
                Text(
                  position,
                  style: AppStyle.txtMontserratRegular20,
                ),
              ],
            ),

          Padding(
            padding: getPadding(top: 15),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgCalendar,
                    height: getSize(
                      22,
                    ),
                    width: getSize(
                      22,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: AppStyle.txtMontserratRegular20,
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 15, bottom: 30),
            child: Row(
              children: [
                Padding(
                  padding: getPadding(right: 20),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgHours,
                    height: getSize(
                      22,
                    ),
                    width: getSize(
                      22,
                    ),
                  ),
                ),
                Text(
                  hours,
                  style: AppStyle.txtMontserratRegular20,
                ),
              ],
            ),
          ),
          DividerV2(
            endIndent: 0,
            indent: 0,
          ),
        ],
      ),
    );
  }
}

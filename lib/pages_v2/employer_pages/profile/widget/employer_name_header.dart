import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/tooltip_widget.dart';

class EmployerNameHeader extends StatelessWidget {
  final double sectionHeight;
  final double widthFactor;
  final String name;
  final String description;
  final double iconWidth; // 40
  final double iconHeight; // 40
  final VoidCallback? onTap;
  final double rating;
  final buttonOntap;
  final String message;
  final bool isOnlyView;

  const EmployerNameHeader(
      {Key? key,
      this.sectionHeight = 54,
      this.widthFactor = 0.8,
      required this.name,
      required this.description,
      this.iconWidth = 400,
      this.iconHeight = 400,
      required this.onTap,
      required this.rating,
      required this.buttonOntap,
      required this.message,
      this.isOnlyView = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          child: SizedBox(
            height: getVerticalSize(
              sectionHeight,
            ),
            width: MediaQuery.of(context).size.width * widthFactor,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: getPadding(right: 10),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgBuilding,
                        ),
                      ),
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratBold28,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isOnlyView,
                  child: ExpandTapWidget(
                    onTap: onTap!,
                    tapPadding: const EdgeInsets.all(5.0),
                    child: Padding(
                        padding: getPadding(right: 10),
                        child: GestureDetector(
                          child: SizedBox(
                            height: getSize(
                              iconHeight,
                            ),
                            width: getSize(
                              iconWidth,
                            ),
                            child: CustomImageView(
                              radius: BorderRadius.circular(50),
                              svgPath: ImageConstant.imgEditPencil,
                              height: getSize(
                                iconHeight * 0.1,
                              ),
                              width: getSize(
                                iconWidth * 0.1,
                              ),
                              alignment: Alignment.topRight,
                            ),
                          ),
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratRegular22,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: getPadding(top: 10),
          child: TooltipWidget(
            message: message,
            direction: AxisDirection.down,
            child: RatingBar.builder(
              ignoreGestures: true,
              initialRating: rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 28,
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
        ),
        !isOnlyView
            ? Padding(
                padding: getPadding(top: 25),
                child: ActionButtonV2(
                    action: buttonOntap,
                    text: MANAGE_SUBSCRIPTION,
                    color: green,
                    maxWidth: 280,
                    textColor: white))
            : Container()
      ],
    );
  }
}

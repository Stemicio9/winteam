import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class AdsDetailFooter extends StatelessWidget {
  final String candidates;
  final onTap;
  final cancelApplication;
  final isApplicant;
  final String text;
  final String viewApplies;
  final goToList;

  final String cancelButtonText;
  final bool isVisible;

  AdsDetailFooter({
    required this.candidates,
    required this.onTap,
    required this.cancelButtonText,
    required this.text,
    required this.cancelApplication,
    this.viewApplies = '',
    this.isApplicant = false,
    this.isVisible = false,
    this.goToList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        candidates != '0'
            ? Padding(
                padding: getPadding(top: 30, right: 35, left: 35),
                child: Row(
                  children: [
                    Padding(
                      padding: getPadding(right: 15),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgPeople,
                        height: getSize(
                          30,
                        ),
                        width: getSize(
                          30,
                        ),
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        text: candidates == "1" ? CANDIDATE : CANDIDATES,
                        style: AppStyle.txtMontserratRegular20,
                        children: <TextSpan>[
                          TextSpan(
                              text: candidates == "1" ? ' $candidates $PERSON' : ' $candidates $PEOPLE',
                              style: AppStyle.txtMontserratBold20,
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              )
            : Padding(
                padding: getPadding(top: 30, right: 20, left: 20),
                child: ListTile(
                  horizontalTitleGap: 0,
                  leading: CustomImageView(
                    imagePath: ImageConstant.imgPeople,
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                  ),
                  title: Text(
                    NO_CANDIDATE,
                    style: AppStyle.txtMontserratRegular20,
                  ),
                ),
              ),
        !isVisible
            ? !isApplicant
                ? Padding(
                    padding: getPadding(top: 30),
                    child: ActionButtonV2(
                        action: onTap,
                        text: text,
                        color: background,
                        maxWidth: 330,
                        textColor: white),
                  )
                : Padding(
                    padding: getPadding(top: 30),
                    child: ActionButtonV2(
                        action: cancelApplication,
                        text: cancelButtonText,
                        color: lightGrey,
                        maxWidth: 330,
                        textColor: black),
                  )
            : Container(),
        candidates != '0'
            ? isVisible
                ? Padding(
                    padding: getPadding(top: 30),
                    child: ActionButtonV2(
                        action: goToList,
                        text: viewApplies,
                        color: background,
                        maxWidth: 330,
                        textColor: white),
                  )
                : Container()
            : Container(),
        candidates == '0'
            ? isVisible
                ? Padding(
                    padding: getPadding(top: 30),
                    child: ActionButtonV2(
                        action: (){},
                        text: viewApplies,
                        color: lightGrey,
                        maxWidth: 330,
                        textColor: greyDisabled),
                  )
                : Container()
            : Container(),
      ],
    );
  }
}

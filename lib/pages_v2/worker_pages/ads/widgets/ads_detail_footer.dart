import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/user_entity.dart';
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
  final List<UserEntity> annuncioUserList;
  final UserEntity? matchedUser;
  final UserEntity currentUser;

  final String cancelButtonText;
  final bool isEmployer;

  AdsDetailFooter(
      {required this.candidates,
      required this.onTap,
      required this.cancelButtonText,
      required this.text,
      required this.cancelApplication,
      this.viewApplies = '',
      this.isApplicant = false,
      this.isEmployer = false,
      this.goToList,
      required this.annuncioUserList,
      required this.currentUser,
      this.matchedUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        candidates != '0'
            ? Padding(
                padding: getPadding(top: 30, right: 35, left: 35),
                child: Wrap(
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
                            text: candidates == "1"
                                ? ' $candidates $PERSON'
                                : ' $candidates $PEOPLE',
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
        Visibility(visible: isEmployer, child: employerSection()),
        Visibility(
          visible: !isEmployer,
          child: applicantSection(),
        ),

        /*
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

        */

      ],
    );
  }

  Widget applicantSection() {

    // DIVIDED IN 4 OPTIONS
    // 1: APPLICANT IS NOT CANDIDATE TO THIS AD AND THERE ARE NO MATCHES --> SHOW APPLY BUTTON
    // 2: APPLICANT IS NOT CANDIDATE AND THERE IS A MATCH ON ANOTHER PERSON--> APPLICANT CANNOT CANDIDATE
    // 3: APPLICANT IS CANDIDATE TO THIS AD, THERE IS A MATCH ON ANOTHER PERSON --> APPLICANT CANNOT DELETE APPLICATION
    // 4: APPLICANT IS CANDIDATE TO THIS AD AND THERE IS A MATCH ON HIMSELF --> APPLICANT CANNOT DELETE APPLICATION
    // 5: APPLICANT IS CANDIDATE TO THIS AD AND THERE ARE NO MATCHES --> SHOW CANCEL APPLICATION BUTTON

    bool isCandidate = annuncioUserList.any((element) => element.id == currentUser.id);
    bool thereIsAMatch = matchedUser != null;
    bool isMatched = matchedUser != null ? matchedUser?.id == currentUser.id : false;
    if (!isCandidate && !thereIsAMatch) {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: onTap,
            text: text,
            color: background,
            maxWidth: 330,
            textColor: white),
      );
    } else if (!isCandidate && thereIsAMatch && !isMatched) {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: () {},
            text: "Non puoi candidarti, già scelto",
            color: background,
            maxWidth: 330,
            textColor: white),
      );
    } else if (isCandidate && thereIsAMatch && !isMatched) {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: () {},
            text: "E' stato scelto un altro candidato",
            color: background,
            maxWidth: 330,
            textColor: white),
      );
    } else if (isCandidate && isMatched) {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: () {},
            text: "Sei stato scelto!",
            color: background,
            maxWidth: 330,
            textColor: white),
      );
    } else if (isCandidate && !thereIsAMatch) {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: cancelApplication,
            text: cancelButtonText,
            color: lightGrey,
            maxWidth: 330,
            textColor: white),
      );
    } else {
      return Container();
    }
  }

  Widget employerSection() {
    // DIVIDED IN OPTIONS
    // 1: THERE ARE NO CANDIDATES --> SHOW NO CANDIDATES
    // 2: THERE ARE CANDIDATES --> SHOW CANDIDATE LIST
    bool thereAreCandidates = annuncioUserList.isNotEmpty;
    if (thereAreCandidates) {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: goToList,
            text: viewApplies,
            color: background,
            maxWidth: 330,
            textColor: white),
      );
    } else {
      return Padding(
        padding: getPadding(top: 30),
        child: ActionButtonV2(
            action: () {},
            text: "Nessun candidato",
            color: lightGrey,
            maxWidth: 330,
            textColor: greyDisabled),
      );
    }
  }
}

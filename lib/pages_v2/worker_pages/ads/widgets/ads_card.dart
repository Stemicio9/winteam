import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/ad_status_utils.dart';
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
  final AnnunciEntity annunciEntity;
  final String candidates;
  String message;
  Color? statusColor;
  final bool isVisible;
  final goToList;
  final goToProfile;
  final bool isWorkerCard;

  AdsCard({
    this.innerImageRadius = 77,
    this.imageWidth = 90,
    this.imageHeight = 90,
    this.innerImageWidth = 90,
    this.innerImageHeight = 90,
    required this.onTap,
    required this.annunciEntity,
    this.message = '',
    this.statusColor = lightGreen,
    this.candidates = '',
    this.isVisible = true,
    this.goToList,
    this.goToProfile,
    this.isWorkerCard = true,
  });


  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

    initializeAds();

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
                    Expanded(
                      flex: 7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: getPadding(right: 20),
                                child: Container(
                                  height: getSize(imageHeight),
                                  width: getSize(
                                    imageWidth,
                                  ),
                                  decoration: isWorkerCard
                                      ? null
                                      : BoxDecoration(
                                          color: lightGrey,
                                          borderRadius: isWorkerCard
                                              ? null
                                              : BorderRadius.circular(
                                                  getHorizontalSize(
                                                    innerImageRadius,
                                                  ),
                                                ),
                                        ),
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        CustomImageView(
                                          onTap: goToProfile,
                                          svgPath: isWorkerCard
                                              ? null
                                              : (annunciEntity.skill?.imageLink ??
                                                  ''),
                                          url: isWorkerCard
                                              ? (annunciEntity.publisherUser?.imageLink ??
                                                  ImageConstant
                                                      .placeholderUserUrl)
                                              : (annunciEntity
                                                      .skill?.imageLink ??
                                                  ''),
                                          imagePath: isWorkerCard
                                              ? annunciEntity.image
                                              : null,
                                          height: getSize(
                                            isWorkerCard
                                                ? innerImageHeight
                                                : 50,
                                          ),
                                          width: getSize(
                                            isWorkerCard ? innerImageWidth : 50,
                                          ),
                                          radius: isWorkerCard
                                              ? BorderRadius.circular(
                                                  getHorizontalSize(
                                                    innerImageRadius,
                                                  ),
                                                )
                                              : null,
                                          alignment: Alignment.center,
                                          fit: isWorkerCard
                                              ? BoxFit.cover
                                              : BoxFit.scaleDown,
                                        ),
                                      ]),
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: isWorkerCard
                                      ? MediaQuery.of(context).size.width * 0.55
                                      : MediaQuery.of(context).size.width *
                                          0.45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: isWorkerCard && !isVisible,
                                        child: Padding(
                                                padding:  getPadding(right: 10),
                                                child: CustomImageView(
                                            svgPath: (annunciEntity
                                                  .skill
                                                  ?.imageLink ??
                                                  ''),
                                            height: getSize(20),
                                            width: getSize(20),
                                          ),
                                              ),

                                      ),


                                      SizedBox(
                                        child: Text(
                                          annunciEntity.skill?.name ?? 'TEST NAME',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle.txtMontserratBold24,
                                        ),
                                      ),
                                  /*    Visibility(
                                        visible: isWorkerCard,
                                        child: Padding(
                                          padding: getPadding(left: 5),
                                          child: isWorkerCard && isVisible
                                              ? null
                                              : CustomImageView(
                                                  svgPath: (annunciEntity
                                                          .skillDTO
                                                          ?.imageLink ??
                                                      ''),
                                                  height: getSize(20),
                                                  width: getSize(20),
                                                ),
                                        ),
                                      ) */
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: goToProfile,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      isWorkerCard ? (annunciEntity.publisherUser?.companyName ?? '') : annunciEntity.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: isWorkerCard
                                          ? AppStyle
                                              .txtMontserratRegularUnderline20
                                          : AppStyle.txtMontserratRegular16,
                                    ),
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
                                          height: getSize(23),
                                          width: getSize(18),
                                        ),
                                      ),
                                      Text(
                                        annunciEntity.position,
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
                                          height: getSize(20),
                                          width: getSize(20),
                                        ),
                                      ),
                                      Text(
                                        AdStatusUtils.formatDate(annunciEntity.date),
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
                                          height: getSize(20),
                                          width: getSize(20),
                                        ),
                                      ),
                                      Text(
                                        annunciEntity.hourSlot,
                                        style: AppStyle.txtMontserratRegular18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: isVisible,
                        child: Column(
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
                                      color: statusColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: statusColor == green ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ) : Container(),
                                  )),
                            ),
                            Padding(
                              padding: getPadding(top: 25),
                              child: GestureDetector(
                                onTap: candidates != '0' ? goToList : () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgPeople,
                                      height: 18,
                                      width: 18,
                                    ),
                                    Padding(
                                      padding: getPadding(left: 5),
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
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: getPadding(top: 25),
                  child: Wrap(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    alignment: WrapAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${annunciEntity.payment} €',
                            style: AppStyle.txtMontserratBold22,
                          )
                        ],
                      ),
                      Padding(
                        padding: getPadding(top: 15),
                        child: ActionButtonV2(
                          action: onTap,
                          text: DETAILS,
                          color: background,
                          maxWidth: 200,
                          textColor: white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  initializeAds() {
    var part = AdStatusUtils.getAdStatus(annunciEntity.advertisementStatus);
    message = 'Stato annuncio: $part';
    statusColor =
        AdStatusUtils.getAdStatusColor(annunciEntity.advertisementStatus);
  }
}

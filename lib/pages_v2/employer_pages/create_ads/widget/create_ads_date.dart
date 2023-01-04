import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/profile_description_edit.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class CreateAdsDate extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20

  final double paddingTop; //30

  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  final TextEditingController fromDateController;
  final TextEditingController toDateController;

  final fromDateOnChanged;
  final fromDateOnConfirm;
  final toDateOnChanged;
  final toDateOnConfirm;

  final fromDateMinTime;
  final fromDateMaxTime;

  final toDateMinTime;
  final toDateMaxTime;

  CreateAdsDate(
      {Key? key,
      this.paddingTop = 30,
      this.paddingLeft = 20,
      this.paddingRight = 20,
      this.customImageViewHeight = 26,
      this.customImageViewWidth = 26,
      required this.toDateController,
      required this.fromDateController,
      required this.fromDateOnChanged,
      required this.fromDateOnConfirm,
      required this.toDateOnChanged,
      required this.toDateOnConfirm,
      required this.toDateMaxTime,
      required this.fromDateMaxTime,
      required this.fromDateMinTime,
      required this.toDateMinTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          getPadding(top: paddingTop, right: paddingRight, left: paddingLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DATE,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          InputsV2Widget(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: fromDateMinTime,
                  maxTime: fromDateMaxTime,
                  onChanged: fromDateOnChanged,
                  onConfirm: fromDateOnConfirm,
                  currentTime: DateTime.now(),
                  locale: LocaleType.it);
            },
            readOnly: true,
            isPrefixIcon: true,
            svgPath: ImageConstant.imgCalendar,
            hinttext: SELECT_DATE,
            controller: fromDateController,
            validator: defaultValidator,
            paddingLeft: 0,
            prefixIconWidth: 22,
            prefixIconHeight:22,
            paddingRight: 0,
            elevation: 5,
            borderRadius: 5,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';
import '../../../../constants/validators.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AdsFilterDate extends StatelessWidget{

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


  AdsFilterDate({
    required this.toDateController,
    required this.fromDateController,
    required this.fromDateOnChanged,
    required this.fromDateOnConfirm,
    required this.toDateOnChanged,
    required this.toDateOnConfirm,
    required this.toDateMaxTime,
    required this.fromDateMaxTime,
    required this.fromDateMinTime,
    required this.toDateMinTime
  });

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: getPadding(right: 35,left: 35,top: 35),
     child: Column(
       children: [
         Row(
           children: [
             Padding(
               padding: getPadding(right: 20),
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
               DATE,
               style: AppStyle.txtMontserratSemiBoldBlack20,
             ),
           ],
         ),
         Padding(
           padding:getPadding(top: 15),
           child: Row(
             children: [
               Container(
                 padding:getPadding(right: 10),
                 width: MediaQuery.of(context).size.width/2 - 30,
                 child: InputsV2Widget(
                   onTap: () {
                     DatePicker.showDatePicker(context,
                         showTitleActions: true,
                         minTime: fromDateMinTime,
                         maxTime: fromDateMaxTime,
                         onChanged: fromDateOnChanged,
                         onConfirm: fromDateOnConfirm,
                         currentTime: DateTime.now(), locale: LocaleType.it);
                   },

                   readOnly: true,
                   isSuffixIcon: true,
                   suffixIcon: ImageConstant.imgDateInput,
                   hinttext: 'da',
                   controller: fromDateController,
                   validator: defaultValidator,
                   paddingLeft: 0,
                   suffixIconWidth: 20,
                   suffixIconHeight: 20,
                   paddingRight: 0,
                   elevation: 5,
                   borderRadius: 5,
                 ),
               ),


               Container(
                 padding:getPadding(left: 10),
                 width: MediaQuery.of(context).size.width/2 -35,
                 child: InputsV2Widget(
                   onTap: () {
                     DatePicker.showDatePicker(context,
                         showTitleActions: true,
                         minTime: toDateMinTime,
                         maxTime: toDateMaxTime,
                         onChanged: toDateOnChanged,
                         onConfirm: toDateOnConfirm,
                         currentTime: DateTime.now(), locale: LocaleType.it);
                   },

                   readOnly: true,
                   isSuffixIcon: true,
                   suffixIcon: ImageConstant.imgDateInput,
                   hinttext: 'a',
                   controller: toDateController,
                   validator: defaultValidator,
                   paddingLeft: 0,
                   suffixIconWidth: 20,
                   suffixIconHeight: 20,
                   paddingRight: 0,
                   elevation: 5,
                   borderRadius: 5,
                 ),
               ),
             ],
           )
         ),
       ],
     ),
   );

  }






}
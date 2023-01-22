import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';


class AdsFilterPrice extends StatelessWidget{

  final TextEditingController priceController;
  final Function(double?) onChanged;

  final dynamic priceValidator;

  AdsFilterPrice({required this.priceController,this.priceValidator, required this.onChanged});

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
                  svgPath: ImageConstant.imgMoney,
                  height: getSize(
                    18,
                  ),
                  width: getSize(
                    22,
                  ),
                ),
              ),
              Text(
                LOWEST_PRICE,
                style: AppStyle.txtMontserratSemiBoldBlack20,
              ),
            ],
          ),
          Padding(
            padding:getPadding(top: 15),
            child: InputsV2Widget(
              isPrefixIcon: true,
              prefixIcon: ImageConstant.imgEuro,
              hinttext: '',
              controller: priceController,
              validator: priceValidator,
              paddingLeft: 0,
              prefixIconHeight: 18,
              prefixIconWidth: 18,
              paddingRight: 0,
              elevation: 5,
              borderRadius: 5,
              keyboard: TextInputType.number,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }


}
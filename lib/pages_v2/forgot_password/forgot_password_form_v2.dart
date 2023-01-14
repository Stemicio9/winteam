import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/widgets/utilities/image_utility.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class ForgotPasswordFormV2 extends StatefulWidget {
  @override
  ForgotPasswordFormV2State createState() {
    return ForgotPasswordFormV2State();
  }
}

class ForgotPasswordFormV2State extends State<ForgotPasswordFormV2> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0,bottom: 150),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logoSection(),
              forgotPassTextSection(),
              forgotPssSection(),
              backSection()
            ],
          )),
    );
  }

  Widget logoSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: const ImagePlaceholder(
        name: LOGO_IMAGE_NAME,
      ),
    );
  }

  Widget forgotPassTextSection() {
    return Texth1V2(
      testo: PASSWORD_RECOVERY,
      color: white,
      textalign: TextAlign.center,
      weight: FontWeight.w600,
    );
  }

  Widget forgotPssSection() {
    return Column(
      children: [
        InputsV2Widget(
          hinttext: INSERT_EMAIL,
          controller: _emailTextController,
          isPassword:false,
          validator: validateEmail,
        ),
        ActionButtonV2(
            text:CONFIRM,
            action:formSubmit,
            maxWidth:190,
            color:green,
            textColor:white,
            marginTop: 30,
        ),
      ],
    );
  }


  Widget backSection(){
    return GestureDetector(
      onTap: (){Navigator.pop(context);},
      child: Texth3V2(
        testo: BACK,
        color: white,
        underline: true,
      )
    );
  }


  formSubmit() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, RouteConstants.login);
    }
  }
}

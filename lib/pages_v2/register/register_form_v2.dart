import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/widgets/texts.dart';
import 'package:winteam/widgets/utilities/image_utility.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class RegisterFormV2 extends StatefulWidget {
  @override
  RegisterFormV2State createState() {
    return RegisterFormV2State();
  }
}

class RegisterFormV2State extends State<RegisterFormV2> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _passwordConfirmTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logoSection(),
              registerTextSection(),
              registerSection(),
              buttonSection(),
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

  Widget registerTextSection() {
    return Texth1V2(
      testo: REGISTER,
      color: white,
      weight: FontWeight.w600,
    );
  }

  Widget registerSection() {
    return Column(
      children: [
        InputsV2Widget(
          hinttext: EMAIL,
          controller: _emailTextController,
        ),
        InputsV2Widget(
          hinttext: PASSWORD,
          controller: _passwordTextController,
          ispassword: true,

        ),
        InputsV2Widget(
          hinttext: PASSWORD_CONFIRM,
          controller: _passwordConfirmTextController,
          ispassword: true,

        ),
      ],
    );
  }

  Widget buttonSection() {
    return ActionButtonV2(REGISTER, () {}, 315);
  }

  Widget backSection() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Texth3V2(
        testo: I_ALREADY_HAVE_ACCOUNT,
        color: white,
        underline: true,
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/utils/image_constant.dart';
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

  var _passwordVisible = false;
  var _confirmPasswordVisible = false;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmTextController =
      TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
    _confirmPasswordVisible = false;
  }

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
          isPassword: false,
          validator: validateEmail,
        ),
        InputsV2Widget(
          hinttext: PASSWORD,
          controller: _passwordTextController,
          isPassword: !_passwordVisible,
          validator: validatePassword,
          isSuffixIcon: true,
          suffixIconHeight: 40,
          suffixIconWidth: 40,
          iconOnTap: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          svgPath: _passwordVisible
              ? ImageConstant.imgPasswordSee
              : ImageConstant.imgPasswordUnsee,
        ),
        InputsV2Widget(
          hinttext: PASSWORD_CONFIRM,
          controller: _passwordConfirmTextController,
          isPassword: !_confirmPasswordVisible,
          validator: validatePassword,
          isSuffixIcon: true,
          suffixIconHeight: 40,
          suffixIconWidth: 40,
          iconOnTap: () {
            setState(() {
              _confirmPasswordVisible = !_confirmPasswordVisible;
            });
          },
          svgPath: _confirmPasswordVisible
              ? ImageConstant.imgPasswordSee
              : ImageConstant.imgPasswordUnsee,
        ),
      ],
    );
  }

  Widget buttonSection() {
    return ActionButtonV2(
      text: REGISTER,
      action: formSubmit,
      maxWidth: 315,
      color: green,
      textColor: white,
    );
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

  formSubmit() async {
    if (_formKey.currentState!.validate()) {

      UserCredential? user = await createUser(_emailTextController.text,_passwordTextController.text);
      if(user == null){
        // @todo la registrazione non è andata a buon fine per qualche motivo
        return;
      }

      // @todo chiamare la rest per creare utente anche sul server Spring

      //HttpResponse<dynamic> response = await userListApiService.register("DATORE");
      HttpResponse<dynamic> response = await userListApiService.register("LAVORATORE");

      if(response.response.statusCode == 200){
        Navigator.pushNamed(context, RouteConstants.login);
      }

    }
  }
}

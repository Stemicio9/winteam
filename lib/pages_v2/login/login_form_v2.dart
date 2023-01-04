import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/widgets/utilities/image_utility.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/checkbox_v2.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserListCubit(),
      child: LoginFormV2(),
    );
  }
}

class LoginFormV2 extends StatefulWidget {
  @override
  LoginFormV2State createState() {
    return LoginFormV2State();
  }
}

class LoginFormV2State extends State<LoginFormV2> {
  UserCubit get _cubit => context.read<UserCubit>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      if (state is UserEmpty) {
        // todo
        // here insert login form
        return allContent();
      } else if (state is UserLoaded) {
        // todo
        // navigare verso la pagina corretta
        return Container();
      } else if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      } else {
        // UserErrorAuthentication
        // todo
        // restituire form con errori in evidenza
        return Container();
      }
    });

    // for testing purpose, insert here Login form
  }

  Widget allContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logoSection(),
              loginTextSection(),
              loginSection(),
              forgotPasswordSection(),
              registerSection()
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

  Widget loginTextSection() {
    return Texth1V2(
      testo: LOGIN,
      color: white,
      weight: FontWeight.w600,
    );
  }

  Widget loginSection() {
    final node = FocusScope.of(context);

    return Column(
      children: [
        InputsV2Widget(
            hinttext: EMAIL,
            controller: _emailTextController,
            validator: validateEmail,
            isPassword: false),
        InputsV2Widget(
          hinttext: PASSWORD,
          controller: _passwordTextController,
          validator: notEmptyValidate,
          isPassword: true,
        ),
        CheckboxV2Widget(),
        ActionButtonV2(
            text: LOGIN,
            action: formSubmit,
            maxWidth: 315,
            color: green,
            textColor: white,
            margin: 10),
      ],
    );
  }

  Widget forgotPasswordSection() {
    return GestureDetector(
        onTap: navigateToForgotPassword,
        child: Texth3V2(
          testo: FORGOT_PASSWORD,
          color: white,
          underline: true,
        ));
  }

  Widget registerSection() {
    return Column(
      children: [
        Texth4V2(testo: DONT_HAVE_AN_ACCOUNT, color: white),
        ActionButtonV2(
            text: REGISTER,
            action: navigateToRegister,
            maxWidth: 200,
            color: green,
            textColor: white,
            margin: 10),
      ],
    );
  }

  formSubmit() async {
    if (_formKey.currentState!.validate()) {
      UserCredential? log =
          await signIn(_emailTextController.text, _passwordTextController.text);

      if (log == null || log.user == null) {
        // @todo avvisare che il login è sbagliato
        return;
      }

      //todo complete this method
      _cubit.saveLoggedUser();
      navigateToDashboard();

      // var a = await log.user!.getIdToken();

      // if (entity == null) return;
      //
      // if (entity.roleId == "DATORE") {
      //   Navigator.pushNamed(context, '/dashboarddatore');
      // } else if (entity.roleId == "LAVORATORE") {
      //   Navigator.pushNamed(context, '/dashboardlavoratore');
      // } else {}

      /*  if (_formKey.currentState!.validate()) {
       navigateToDashboard();
     } */
    }
  }

  navigateToForgotPassword() {
    Navigator.of(context).pushNamed(RouteConstants.passDimenticata);
  }

  navigateToDashboard() {
    Navigator.of(context).pushNamed(RouteConstants.dashboard);
  }

  navigateToRegister() {
    Navigator.of(context).pushNamed(RouteConstants.registrazione);
  }
}

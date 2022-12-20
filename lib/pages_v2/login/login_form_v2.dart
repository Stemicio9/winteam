
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/authentication_bloc.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/user_entity.dart';
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


class LoginFormV2 extends StatefulWidget{
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
   /* return BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is NotAuthenticated) {
            // todo
            // here insert login form
            return Container();
          } else if (state is UserAuthenticated) {
            // todo
            // navigare verso la pagina corretta
            return Container();
          } else if (state is UserAuthenticationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // UserErrorAuthentication
            // todo
            // restituire form con errori in evidenza
            return Container();
          }
        }); */

    // for testing purpose, insert here Login form
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [

              logoSection(),

              loginTextSection(),

              loginSection(),

              forgotPasswordSection(),

              registerSection()
          ],
        )
      ),
    );
  }


  Widget logoSection(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      child: const ImagePlaceholder(
        name: LOGO_IMAGE_NAME,
      ),
    );
  }

  Widget loginTextSection(){
    return Texth1V2(
      testo: LOGIN,
      color: white,
      weight: FontWeight.w600,

    );
  }

  Widget loginSection(){
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

        CheckboxV2Widget(),

        ActionButtonV2(LOGIN, (){}, 315),
      ],
    );
  }

  Widget forgotPasswordSection(){
    return GestureDetector(
        onTap: vaiapaginapassworddimenticata,
        child: Texth3V2(
      testo: FORGOT_PASSWORD,
      color: white,
      underline: true,
        )
    );
  }

  Widget registerSection(){
    return Column(
      children: [
        Texth4V2(
            testo: DONT_HAVE_AN_ACCOUNT,
            color: white
        ),

        ActionButtonV2(
            REGISTER,
            vaiapaginaregistrati,
            200
        ),
      ],
    );
  }

  vaiapaginapassworddimenticata(){
    Navigator.of(context).pushNamed(RouteConstants.passDimenticata);
  }

  vaiapaginaregistrati(){
    Navigator.of(context).pushNamed(RouteConstants.registrazione);
  }

}


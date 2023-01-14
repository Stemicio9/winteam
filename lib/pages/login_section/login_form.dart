


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/cosstanti_tema.dart';
import 'package:winteam/entities/user_entity.dart';

import '../../widgets/action_buttons.dart';
import '../../widgets/inputs.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserListCubit(),
      child: LoginForm(),
    );
  }
}


class LoginForm extends StatefulWidget{
  @override
  LoginFormState createState() {
    return LoginFormState();
  }

}

class LoginFormState extends State<LoginForm> {

  UserCubit get _cubit => context.read<UserCubit>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[

              // Add TextFormFields and ElevatedButton here.
              InputWidget(
                hinttext: "email@example.com",
                controller: _emailTextController,
                ispassword: false,
                validator: validaemail,
                labeltext: "Email",
              ),

              spaziotrawidgetinaltezza(context, 30),

              InputWidget(
                hinttext: "Password",
                controller: _passwordTextController,
                ispassword: true,
                validator: validapassword,
                labeltext: "Password",
              ),

              spaziotrawidgetinaltezza(context, 50),

           /*   BlocBuilder<UserCubit, UserState>(
                  builder: (_, state) {

                    if (state is UserError) {
                     // return const Center(child: CircularProgressIndicator());
                      return Container();
                    } else {
                      // @todo insert here button that calls login
                      return ActionButton('Lavoratore', (){ formsubmit();
                        },250);
                    }
                  }), */
              ActionButton('Entra', (){formsubmit();}, 125,azzurroscuro, Colors.white),
         /*     Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ActionButton('Datore', (){Navigator.pushNamed(context, '/dashboarddatore');}, 125,azzurroscuro, Colors.white),
                  ActionButton('Lavoratore', (){Navigator.pushNamed(context, '/dashboardlavoratore');}, 125,azzurroscuro, Colors.white),
                ],
              ) */




            ]
        )
    );
  }


  String? validaemail(String value) {
    /*  if (value.isEmpty) {
      return 'Inserire username';
    }
    if(!value.isValidEmail()){
      return "Inserire un indirizzo email valido";
    }
    return null; */
  }


  String? validapassword(String value) {
    if (value.isEmpty) {
      return 'Inserire una password';
    }
    return null;
  }


  formsubmit() async {

    /* if (_formKey.currentState!.validate()) {
      String token = (await loginservice.login(_emailTextController.text, _passwordTextController.text));
      print("TOKEN");
      print(token);
      if(token == 'ERR'){

      }
      var response = await loginservice.me();
      print("RISPOSTA AL LOGIN");
      print(response);
      if(response == 'NO'){
        return;
      }
      UtenteCompleto result = UtenteCompleto.fromJson(response);
      if(result.ruolo == "datore") {
        Navigator.of(context).pushNamed("/dashboarddatore");
      }else {
        Navigator.of(context).pushNamed("/dashboardlavoratore");
      }
    }
    //  Navigator.of(context).pushNamed('/dashboardlavoratore');
  }
  if (_formKey.currentState!.validate()) {


}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  } */

    if (_formKey.currentState!.validate()) {
        UserCredential? log = await signIn(_emailTextController.text, _passwordTextController.text);

        if(log == null || log.user == null){
          // @todo avvisare che il login è sbagliato
          return;
        }

        var a = await log!.user!.getIdToken();

        // DATORE, LAVORATORE, INFLUENCER
        UserEntity? entity = await _cubit.me();

        if(entity == null) return;


        if(entity.roleId == "DATORE"){
          Navigator.pushNamed(context, '/dashboarddatore');
        }else if(entity.roleId == "LAVORATORE"){
          Navigator.pushNamed(context, '/dashboardlavoratore');
        }else{

        }
    }
  }
}




import 'package:flutter/material.dart';
import 'package:winteam/constants/cosstanti_tema.dart';


import '../../widgets/action_buttons.dart';
import '../../widgets/inputs.dart';


class LoginForm extends StatefulWidget{
  @override
  LoginFormState createState() {
    return LoginFormState();
  }

}

class LoginFormState extends State<LoginForm> {


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
                hinttext: "email@esempio.com",
                controller: _emailTextController,
                ispassword: false,
                validator: validaemail,
                labeltext: "Email",),

              spaziotrawidgetinaltezza(context, 30),

              InputWidget(hinttext: "password",
                controller: _passwordTextController,
                ispassword: true,
                validator: validapassword,
                labeltext: "Password",
              ),

             /* ActionButton(
                  'Datore',
                  context,
                      (){
                    Navigator.pushNamed(context, '/dashboarddatore');
                  }
              ), */
              spaziotrawidgetinaltezza(context, 20),


              ActionButton('Lavoratore', context, (){Navigator.pushNamed(context, '/dashboardlavoratore');
              }),

              // entrabutton("Entra",context, formsubmit),


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

}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  } */
  }
}

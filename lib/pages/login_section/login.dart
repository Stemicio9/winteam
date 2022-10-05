

import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';


import '../../constants/cosstanti_tema.dart';
import '../../startup/permission_requests.dart';
import 'login_background.dart';
import 'login_form.dart';


const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login> {

  @override
  void initState() {
    richiedituttipermessiiniziali();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child:
              Stack(
                children: <Widget>[
                  Background(),
                  loginelements(context),
                ],
              ),
            ),
          )
        ),
      )
    );
  }


  Widget loginelements(BuildContext context){
    return
      Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              spaziotrawidgetinaltezza(context,20),

              LoginForm(),

              spaziotrawidgetinaltezza(context,20),

              Center(
                  child: GestureDetector(
                      onTap: vaiapaginapassworddimenticata,
                      child: const Text("Password dimenticata?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline
                        ),)
                  )
              ),


              spaziotrawidgetinaltezza(context,20),

              const Center(
                  child: Text("Non hai un account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,

                    ),)

              ),

              ActionButton("Registrati", context, vaiapaginaregistrati,250,azzurroscuro, Colors.white),


            ],
          )
      );
  }


  vaiapaginapassworddimenticata(){
    Navigator.of(context).pushNamed(RouteConstants.passDimenticata);
  }

  vaiapaginaregistrati(){
    Navigator.of(context).pushNamed("/registrazione");
  }

}
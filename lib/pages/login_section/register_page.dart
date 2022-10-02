import 'package:flutter/material.dart';
import 'package:winteam/pages/login_section/login_background.dart';
import 'package:winteam/pages/login_section/register_form.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => RegisterPageState();

}


class RegisterPageState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: SingleChildScrollView(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child:
                Stack(
                  children: <Widget>[
                    Background(logo: false),
                    registerElements(context)
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  Widget registerElements(BuildContext context){
    return
      Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Registrati(),

            ],
          )
      );
  }
}
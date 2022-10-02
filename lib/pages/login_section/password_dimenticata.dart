import 'package:flutter/material.dart';
import 'package:winteam/pages/login_section/login_background.dart';

import 'password_dimenticata_form.dart';

class PasswordDimenticata extends StatefulWidget{
  @override
  State<PasswordDimenticata> createState() => PasswordDimenticataState();

}


class PasswordDimenticataState extends State<PasswordDimenticata>{
  @override
  Widget build(BuildContext context) {
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
                    Background(logo: false),
                    forgotPasswordElements(context)
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  Widget forgotPasswordElements(BuildContext context){
    return
      Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              PasswordDimenticataForm(),

            ],
          )
      );
  }
}
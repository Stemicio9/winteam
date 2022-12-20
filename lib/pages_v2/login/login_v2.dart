


import 'package:flutter/material.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/login/login_form_v2.dart';

class LoginPageV2 extends StatefulWidget {
  const LoginPageV2({Key? key}) : super(key: key);

  @override
  State<LoginPageV2> createState() => _LoginPageV2State();
}

class _LoginPageV2State extends State<LoginPageV2> {
  @override
  Widget build(BuildContext context) {
     return W1NScaffoldWithBackground(
         body: LoginFormV2()
     );
  }



}






import 'package:flutter/material.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/login/login_form_v2.dart';

class LoginV2 extends StatefulWidget {
  const LoginV2({Key? key}) : super(key: key);

  @override
  State<LoginV2> createState() => _LoginV2State();
}

class _LoginV2State extends State<LoginV2> {
  @override
  Widget build(BuildContext context) {
     return W1NScaffold(
         body: LoginFormV2()
     );
  }
}



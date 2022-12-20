


import 'package:flutter/material.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/register/register_form_v2.dart';

class RegisterPageV2 extends StatefulWidget {
  const RegisterPageV2({Key? key}) : super(key: key);

  @override
  State<RegisterPageV2> createState() => _RegisterPageV2State();
}

class _RegisterPageV2State extends State<RegisterPageV2> {
  @override
  Widget build(BuildContext context) {
    return W1NScaffoldWithBackground(
        body: RegisterFormV2()
    );
  }
}



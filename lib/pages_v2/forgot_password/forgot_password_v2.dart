import 'package:flutter/material.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/forgot_password/forgot_password_form_v2.dart';

class ForgotPasswordV2 extends StatefulWidget {
  const ForgotPasswordV2({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordV2> createState() {
    return _ForgotPasswordV2State();
  }
}

class _ForgotPasswordV2State extends State<ForgotPasswordV2> {
  @override
  Widget build(BuildContext context) {
    return W1NScaffoldWithBackground(
        body: ForgotPasswordFormV2()
    );
  }
}
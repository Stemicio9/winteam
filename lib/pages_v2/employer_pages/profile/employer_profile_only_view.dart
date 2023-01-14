import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/employer_pages/profile/employer_profile_v2.dart';

class EmployerProfileOnlyView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return W1nScaffold(
        appBar: 1,
        title: PROFILE,
        body:EmployerProfile(
          isOnlyView: true,
        )
    );
  }

}
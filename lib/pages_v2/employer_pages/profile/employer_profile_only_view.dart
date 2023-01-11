import 'package:flutter/material.dart';
import 'package:winteam/pages_v2/employer_pages/profile/employer_profile_v2.dart';

class EmployerProfileOnlyView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return EmployerProfile(
      isOnlyView: true,
    );
  }

}
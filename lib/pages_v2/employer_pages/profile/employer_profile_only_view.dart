import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_v2.dart';

class EmployerProfileOnlyView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const W1nScaffold(
        appBar: 1,
        title: PROFILE,
        body:WorkerProfileV2Widget(
          isOnlyView: true,
          datore: true,
        )
    );
  }

}
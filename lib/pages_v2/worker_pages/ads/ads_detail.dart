import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';

class AdsDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AdsDetailState();
  }

}


class AdsDetailState extends State<AdsDetail>{
  @override
  Widget build(BuildContext context) {
    return W1NScaffold(
      backgroundColor: lightGrey,
      title: ANNUNCIO,
      body: Container(),
    );
  }

}
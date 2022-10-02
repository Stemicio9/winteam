import 'package:flutter/material.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/drawerWidget.dart';

class AnnunciLavoratore extends StatefulWidget {
  @override
  State<AnnunciLavoratore> createState() => AnnunciLavoratoreState();
}

class AnnunciLavoratoreState extends State<AnnunciLavoratore>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: appbarConAction('Annunci', context),
      drawer: DrawerWidget(),
      body: Center(
        child: Text('BODY'),
      ),
    );
  }

}
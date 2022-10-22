import 'package:flutter/material.dart';
import 'package:winteam/widgets/appbars.dart';

class AggiungiSkill extends StatefulWidget{
  @override
  State<AggiungiSkill> createState() => AggiungiSkillState();
}


class AggiungiSkillState extends State<AggiungiSkill>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSenzaActions(context, 'Aggiungi skill'),
      body: Center(
        child: Text(
          'BODY '
        ),
      ),
    );
  }

}
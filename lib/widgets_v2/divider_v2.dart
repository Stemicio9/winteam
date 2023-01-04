import 'package:flutter/material.dart';

class DividerV2 extends StatelessWidget{

  final double indent;
  final double endIndent;


  DividerV2({this.indent = 35,this.endIndent=35})
;
  @override
  Widget build(BuildContext context) {
    return Divider(
    indent: indent,
    endIndent: endIndent,
    color: Colors.black,
    );
  }

}
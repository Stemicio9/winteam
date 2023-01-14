


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SkillChip extends StatelessWidget {


  final String skillName;
  final String hexColorText;
  final String hexColorBackground;
  final String imageLink;

  SkillChip({required this.skillName, required this.hexColorText, required this.hexColorBackground, required this.imageLink});


  @override
  Widget build(BuildContext context) {
     return Chip(
       labelPadding: const EdgeInsets.only(right: 10,left: 10,top: 4,bottom: 4),
       label: Text(skillName ?? "", style: TextStyle(color: getColor(hexColorText, defaultColor: "FFFFFF"))),
       avatar: ClipOval(
         child: SizedBox.fromSize(
             size: Size.fromRadius(48), // Image radius
             child: imageLink.isNotEmpty ? Image.network(imageLink, fit: BoxFit.cover) : Image.network('assets/images/avatar_image.png', fit: BoxFit.cover)
         ),
       ),
       backgroundColor: getColor(hexColorBackground),
       shape: StadiumBorder(side: BorderSide(color: getColor(hexColorText))),
     );
  }

  HexColor getColor(String colorHex, {String defaultColor = "0000FF"}){
    try{
      var result = HexColor(colorHex);
      return result;
    }catch(e){
      return HexColor(defaultColor);
    }
  }




}



import 'package:flutter/material.dart';

Widget getImageFromName(String name) {
  return Image.asset("assets/images/$name");
}


class ImagePlaceholder extends StatelessWidget {

  final double width;
  final double height;
  final double opacity;

  final String name;

  const ImagePlaceholder({Key? key, this.width = 150, this.height = 150, this.opacity = 1, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Image.asset("assets/images/$name",
         width: width,
         height: height,
         fit: BoxFit.cover,
         opacity: AlwaysStoppedAnimation(opacity),
     );
  }


}

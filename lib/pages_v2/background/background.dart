

import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/widgets/utilities/image_utility.dart';

class BackgroundV2 extends StatelessWidget {
  const BackgroundV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePlaceholder(
      name: BACKGROUND_IMAGE_NAME,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      opacity: 0.3,);
  }
}

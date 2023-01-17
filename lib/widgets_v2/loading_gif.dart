

import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';


// TODO sostituire tutti i circular progress indicators con questa metodo
// PER EGG: ATTENTO ALLE DIMENSIONI INSERITE, NON SONO STATE TESTATE
Widget loadingGif({height = 125.0, width = 125.0, bool logoBlue = true}) {

  return Image.asset(
    logoBlue ? LOGO_BLUE_GIF_PATH : LOGO_GIF_PATH,
    height: height,
    width: width,
  );
}


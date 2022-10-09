import 'dart:ui';

import 'package:flutter/material.dart';

const Color azzurroscuro = Color(0xFF03A0FE);
const Color azzurrochiaro = Color(0xFF0EDED2);
const Color giallo = Color.fromRGBO(254, 167, 10, 1);
final Color verde = const Color(0xFF2FE000).withOpacity(0.2);
final Color verdeopaco = const Color(0xFF468A33).withOpacity(0.6);
const Color verdepieno = Color(0xFF2FE000);
const Color arancio = Color(0xFFE07400);
const Color blunotte = Color(0xFF010392);
const Color giallochiaro = Color(0xFFFFCD00);


final Color rossoopaco = Color(0xFFFF0000).withOpacity(0.6);
final Color rossomoltoopaco = Color(0xFFFF0000).withOpacity(0.1);
final Color gialloopaco = Color.fromRGBO(254, 167, 10, 1).withOpacity(0.6);
final Color giallomoltoopaco = Color.fromRGBO(254, 167, 10, 1).withOpacity(0.1);
final Color verdemoltoopaco = const Color(0xFF2FE000).withOpacity(0.1);
final Color azzurroscuromoltoopaco = Color(0xFF03A0FE).withOpacity(0.1);







Map<int, Color> azzurroscuroformaterial =
{
  50:azzurroscuro.withOpacity(0.1),
  100:azzurroscuro.withOpacity(0.2),
  200:azzurroscuro.withOpacity(0.3),
  300:azzurroscuro.withOpacity(0.4),
  400:azzurroscuro.withOpacity(0.5),
  500:azzurroscuro.withOpacity(0.6),
  600:azzurroscuro.withOpacity(0.7),
  700:azzurroscuro.withOpacity(0.8),
  800:azzurroscuro.withOpacity(0.9),
  900:azzurroscuro,
};

Map<int, Color> gialloformaterial =
{
  50:const Color.fromRGBO(254, 167, 10, 0.1),
  100:const Color.fromRGBO(254, 167, 10, 0.2),
  200:const Color.fromRGBO(254, 167, 10, 0.3),
  300:const Color.fromRGBO(254, 167, 10, 0.4),
  400:const Color.fromRGBO(254, 167, 10, 0.5),
  500:const Color.fromRGBO(254, 167, 10, 0.6),
  600:const Color.fromRGBO(254, 167, 10, 0.7),
  700:const Color.fromRGBO(254, 167, 10, 0.8),
  800:const Color.fromRGBO(254, 167, 10, 0.9),
  900:const Color.fromRGBO(254, 167, 10, 1),
};



final List<Color> gradientlistaaziende = [verde, azzurroscuro];

ThemeData stiletema = ThemeData(
    brightness: Brightness.light,
    primarySwatch: MaterialColor(0xFF03A0FE, azzurroscuroformaterial),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme(
        primary: azzurroscuro,
        secondary: MaterialColor(giallo.value, gialloformaterial),
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.blue,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.redAccent,
        brightness: Brightness.light
    ),
    buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF03A0FE),
        textTheme: ButtonTextTheme.primary)
);
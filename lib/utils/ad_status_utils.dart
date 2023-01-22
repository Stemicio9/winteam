import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';

class AdStatusUtils {

  static String getAdStatus(String status) {
    switch (status) {
      case 'active':{return 'Attivo';}
      case 'accepted':{return 'Accettato';}
      case 'history':{return 'Storico';}
      case 'all':{return 'Attivo';}
      case 'current':{return 'W1n';}

      default:
        {
          print('stato annuncio non trovato');
          return '';
        }
    }
  }

  static Color getAdStatusColor(String status) {
    switch (status) {
      case 'active':{return lightGreen;}
      case 'accepted':{return blueState;}
      case 'history':{return greyState;}
      case 'all':{return lightGreen;}
      case 'current':{return green;}

      default:
        {
          print('stato annuncio non trovato');
          return Colors.redAccent;
        }
    }
  }

  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }


}
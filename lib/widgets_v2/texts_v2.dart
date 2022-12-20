import 'package:flutter/cupertino.dart';

class Texth1V2 extends StatelessWidget {
  final String testo;
  final Color color;
  final bool? underline;
  final FontWeight? weight;
  final TextAlign? textalign;

  Texth1V2({required this.testo, required this.color, this.underline,this.weight, this.textalign});

  @override
  Widget build(BuildContext context) {
    return Text(
        testo,
        textAlign: textalign,
        style: TextStyle(
          fontSize: 24,
          color: color,
          fontWeight: weight,
          decoration: (underline != null && underline!)
              ? TextDecoration.underline
              : null,
        )
    );
  }
}



class Texth2V2 extends StatelessWidget {
  final String testo;
  final Color color;
  final bool? underline;
  final FontWeight? weight;
  final TextAlign? textalign;

  Texth2V2({required this.testo, required this.color, this.underline, this.weight, this.textalign});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      textAlign: textalign,
      style: TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: weight,
        decoration:
            (underline != null && underline!) ? TextDecoration.underline : null,
      ),
    );
  }
}



class Texth3V2 extends StatelessWidget {
  final String testo;
  final Color color;
  final bool? underline;
  final FontWeight? weight;
  final TextAlign? textalign;

  Texth3V2({required this.testo, required this.color, this.underline, this.weight, this.textalign});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      textAlign: textalign,
      style: TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: weight,
        decoration:
            (underline != null && underline!) ? TextDecoration.underline : null,
      ),
    );
  }
}



class Texth4V2 extends StatelessWidget {
  final String testo;
  final Color color;
  final bool? underline;
  final FontWeight? weight;
  final TextAlign? textalign;

  Texth4V2({required this.testo, required this.color, this.underline, this.weight, this.textalign});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      textAlign: textalign,
      style: TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: weight,
        decoration:
        (underline != null && underline!) ? TextDecoration.underline : null,
      ),
    );
  }
}


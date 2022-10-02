import 'package:flutter/cupertino.dart';

class Texth1 extends StatelessWidget{

  final String testo;
  final Color color;

  Texth1({required this.testo,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      style: TextStyle(
        fontSize: 25,
        color: color
      ),
    );
  }
}



class Texth3 extends StatelessWidget{

  final String testo;
  final Color color;


  Texth3({required this.testo, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      style: TextStyle(
        fontSize: 20,
          color: color

      ),
    );
  }
}



class Texth5 extends StatelessWidget{

  final String testo;
  final Color color;


  Texth5({required this.testo, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      style: TextStyle(
        fontSize: 15,
        color: color

      ),
    );
  }
}
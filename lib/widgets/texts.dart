import 'package:flutter/cupertino.dart';

class Texth1 extends StatelessWidget{

  final String testo;

  Texth1({required this.testo});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }
}



class Texth3 extends StatelessWidget{

  final String testo;

  Texth3({required this.testo});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}



class Texth5 extends StatelessWidget{

  final String testo;

  Texth5({required this.testo});

  @override
  Widget build(BuildContext context) {
    return Text(
      testo,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
}
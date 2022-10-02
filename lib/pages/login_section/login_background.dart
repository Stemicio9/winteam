



import 'package:flutter/material.dart';

import '../../constants/assets_links.dart';



const List<Color> greengradient = [
  Color(0xFF2FE000),
  Color(0x5F2FCF33),
  Color(0x5F2FCF33),
  Color(0xFF2FE000),
];

const List<Color> wingradient = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const Color calltoactionlogin = Color.fromRGBO(254, 167, 10, 1);


class Background extends StatelessWidget {

  bool logo = true;


  Background({this.logo = true});


  @override
  Widget build(BuildContext context) {
    return Container(
//       resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              logo ? avatarlogin(context) : Container(),
              WavyHeader()
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              WavyFooter(),
              CirclePink(),
              CircleYellow()
            ],
          )
        ],
      ),
    );
  }

}


class WavyHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: greengradient,
                begin: Alignment.topLeft,
                end: Alignment.center
            ),
          ),
          height: MediaQuery.of(context).size.height / 3.2
      ),
    );
  }

}

class WavyFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: wingradient,
                  begin: Alignment.center,
                  end: Alignment.bottomRight
              )
          ),
          height: MediaQuery.of(context).size.height / 5
      ),
    );
  }

}

class CircleYellow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(0.0, 210.0),
        child: const Material(
            color: calltoactionlogin,
            child: Padding(padding: EdgeInsets.all(140)),
            shape: CircleBorder(side: BorderSide(color: Colors.white,width: 15.0))
        )
    );
  }
}

class CirclePink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: const Offset(-50.0, 150.0),
        child: const Material(
            color: Colors.redAccent,
            child: Padding(padding: EdgeInsets.all(120)),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent,width: 15.0))
        )
    );
  }

}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 6, size.height - 30);
    var firstEndPoint = Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset( size.width/3 , size.height / 4);
    var secondEndPoint = Offset(size.width , 0.0);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    /*    var thirdControlPoint = Offset( size.width/1.9 , size.height / 6);
     var thirdEndPoint = new Offset(size.width - size.width/25, 0.0);

     path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
         thirdEndPoint.dx, thirdEndPoint.dy); */

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}


class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0 , size.height - size.height/2);
    var secondControlPoint = Offset( size.width - (size.width/6) , size.height);
    var secondEndPoint = Offset(size.width , 0.0);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}



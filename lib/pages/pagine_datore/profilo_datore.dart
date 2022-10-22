import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/texts.dart';

import '../../constants/colors.dart';

class ProfiloDatore extends StatefulWidget {
  @override
  State<ProfiloDatore> createState() => ProfiloDatoreState();
}

class ProfiloDatoreState extends State<ProfiloDatore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  children: [
                    Container(padding: EdgeInsets.only(top: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: azzurroscuro, width: 3),
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage("assets/images/avatar_image.png"),
                              ),
                              Positioned(
                                  bottom: -5,
                                  right: -20,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          RouteConstants.modificaProfiloDatore);
                                    },
                                    elevation: 2.0,
                                    fillColor: Color(0xFFF5F6F9),
                                    child: Icon(Icons.edit_rounded,
                                        color: giallo),
                                    padding: EdgeInsets.all(5.0),
                                    shape: CircleBorder(),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: 10)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Texth1(
                        testo: 'Eggbert Company S.r.l.',
                        color: Colors.black,
                      ),
                    ]),
                    Container(padding: EdgeInsets.only(top: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          itemSize: 30,
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                    Container(padding: EdgeInsets.only(top: 10)),

                    ActionButton('Gestisci abbonamento', context, () {}, 200,
                        azzurroscuro, Colors.white),
                    Container(padding: EdgeInsets.only(top: 20)),
                    Row(
                      children: [
                        Icon(Icons.info, color: azzurroscuro),
                        Container(
                          padding: EdgeInsets.only(right: 7),
                        ),
                        const Text(
                          'Informazioni di contatto',
                          style: TextStyle(color: azzurroscuro, fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Icon(
                            Icons.attach_email_outlined,
                            color: giallo,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 7),
                          ),
                          Text('esempio@gmail.com'),
                        ]),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Icon(
                            Icons.phone,
                            color: giallo,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 7),
                          ),
                          Text('3479463027')
                        ]),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Icon(
                            Icons.home_work_outlined,
                            color: giallo,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 7),
                          ),
                          Text('Via delle Uova 28'),
                        ]),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: giallo,
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 7),
                          ),
                          Text('Rende'),
                        ]),
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(top: 20)),

                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.speaker_notes, color: azzurroscuro),
                            Container(
                              padding: EdgeInsets.only(right: 7),
                            ),
                            const Text(
                              'Chi siamo',
                              style: TextStyle(color: azzurroscuro, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Text(
                          "This text is very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very very long",
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),

                      ],
                    ),
                  ]
              ),
            ),
          ],
        ),
      )
    );
  }
}

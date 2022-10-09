import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:winteam/constants/colors.dart';

Widget CardCandidato(){
  return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(top: 10)),

              Container(
                  width: double.infinity,
                  child: Row(
                    children: [

                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: azzurroscuro,
                              width: 2
                          ),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: AssetImage('assets/images/profiledefault.jpeg'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text( 'Nome Cognome', style:  TextStyle(color: azzurroscuro, fontSize: 16),),
                            Text('Città', textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      Container(
                        width: 60,
                        height: 60,
                        child: CircularPercentIndicator(
                          radius: 25.0,
                          lineWidth: 5.0,
                          percent: 0.8,
                          center: new Text("80%", style: TextStyle(fontWeight: FontWeight.bold),),
                          progressColor: Colors.green,
                        ),
                      ),
                    ],
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 10)),

              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10,
                        children:  [

                          Chip(
                            label: Text(
                                'Skill1',
                                style: TextStyle(
                                    color: azzurroscuro
                                )
                            ),
                            backgroundColor: azzurroscuromoltoopaco,
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: azzurroscuro)
                            ),
                          ),
                          Chip(
                            label: Text(
                                'Skill2',
                                style: TextStyle(
                                    color: Colors.green
                                )
                            ),
                            backgroundColor: verdemoltoopaco,
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Colors.green)
                            ),
                          ),
                          Chip(
                            label: Text(
                                'Skill3',
                                style: TextStyle(
                                    color: Colors.red
                                )
                            ),
                            backgroundColor: rossomoltoopaco,
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Colors.red)
                            ),
                          ),
                          Chip(
                            label: Text(
                                'Skill4',
                                style: TextStyle(
                                    color:giallo
                                )
                            ),
                            backgroundColor: giallomoltoopaco,
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: giallo)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Icon(Icons.info_rounded, color: azzurroscuro),
                  Container(padding: EdgeInsets.only(right: 7),),
                  const Text('Contatti candidato', style: TextStyle(color: azzurroscuro,fontSize: 16),),
                ],
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text('Email: esempio@gmail.com'),
                        Icon(Icons.attach_email_outlined, color: giallo,)
                      ]
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text('Telefono: 3479463027'),
                        Icon(Icons.phone, color: giallo,)

                      ]
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                ],
              ),


            ],
          )
      )
  );
}
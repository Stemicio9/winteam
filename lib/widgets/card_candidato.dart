import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/widgets/skill_chip.dart';



class CardCandidato extends StatelessWidget {

  final UserEntity user;

  CardCandidato({required this.user});


  @override
  Widget build(BuildContext context) {
     return Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(margin: EdgeInsets.only(top: 10)),

                heading(),

                Padding(padding: EdgeInsets.only(top: 10)),

                skillSection(),

                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Icon(Icons.info_rounded, color: azzurroscuro),
                    Container(padding: EdgeInsets.only(right: 7),),
                    const Text('Contatti candidato', style: TextStyle(color: azzurroscuro,fontSize: 16),),
                  ],
                ),

               contactSession()

              ],
            )
        )
    );
  }



  Widget heading(){
    return   Container(
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
                    image: AssetImage('assets/images/avatar_image.png'),
                    fit: BoxFit.fill
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text( "${user.firstName} ${user.lastName}", style:  TextStyle(color: azzurroscuro, fontSize: 16),),
                  Text( "${user.city}", textAlign: TextAlign.left,
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
    );
  }



  Widget skillSection(){
    return Container(
        width: double.infinity,

        height: 80,
        child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: user.skillList!.length,
              itemBuilder: (_,index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SkillChip(
                      skillName: user.skillList![index].name!,
                      hexColorText: user.skillList![index].hexColorText!,
                      hexColorBackground: user.skillList![index].hexColorBackground!,
                      imageLink: user.skillList![index].imageLink!),
                );
              }
          ),
    );
  }

  Widget contactSession(){
    return  Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 8)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(user.email ?? ""),
              Icon(Icons.attach_email_outlined, color: giallo,)
            ]
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(user.phoneNumber ?? ""),
              Icon(Icons.phone, color: giallo,)

            ]
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
      ],
    );
  }


}


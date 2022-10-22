
import 'package:flutter/material.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/cosstanti_tema.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/texts.dart';
import '../../widgets/action_buttons.dart';
import '../../widgets/inputs.dart';


class PasswordDimenticataForm extends StatefulWidget {

  String? emailcorrente;

  PasswordDimenticataForm({this.emailcorrente});

  @override
  PasswordDimenticataFormState createState() {
    return PasswordDimenticataFormState();
  }

}

class PasswordDimenticataFormState extends State<PasswordDimenticataForm>{

  TextEditingController emailcontroller = TextEditingController();

  String risposta = '';

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, RouteConstants.login);},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Icon(Icons.arrow_back_ios, color: azzurroscuro,size: 40  ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Image.asset('assets/images/logo.png',height: 100,width: 100),

                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 50),
            ),
            Texth1(testo: 'RECUPERA PASSWORD', color: Colors.black),

            Container(
              margin: EdgeInsets.only(bottom: 100),
            ),
            InputWidget(
              labeltext: 'Inserisci la tua Email',
              hinttext: "email@example.com",
              controller: emailcontroller,
              ispassword: false,),



          /*  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: risposta != null ?
                Text(risposta, style: const TextStyle(
                    fontSize: 16
                ), textAlign: TextAlign.center,) : Container(),
              ),
            ), */

            spaziotrawidgetinaltezza(context, 30),

            ActionButton("Cambia password", context,submit,250,azzurroscuro, Colors.white),

            Image.asset('assets/images/giphy.gif' ,height: 175, width: 175),

            Container(
              margin: EdgeInsets.only(bottom: 100),
            )

          ],
        );

  }



  submit() async{
    /* String result = await loginservice.resetpassword(emailcontroller.text);
    setState(() {
      risposta = result;
    }); */
    var result = await askResetPassword(emailcontroller.text);
    if(result){
      // @todo inserire qui il toaster per dire che è stata inviata una mail all'indirizzo ${emailcontroller.text}
    }
  }

}
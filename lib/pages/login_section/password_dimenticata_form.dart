
import 'package:flutter/material.dart';
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
            Texth1(testo: 'RECUPERA PASSWORD', color: Colors.black),

            spaziotrawidgetinaltezza(context, 10),

            InputWidget(labeltext: 'Inserisci la tua Email', hinttext: "esempio@email.it", controller: emailcontroller, ispassword: false,),



          /*  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: risposta != null ?
                Text(risposta, style: const TextStyle(
                    fontSize: 16
                ), textAlign: TextAlign.center,) : Container(),
              ),
            ), */

            spaziotrawidgetinaltezza(context, 20),

            ActionButton("Cambia password", context,submit),

            Image.asset('assets/images/giphy.gif' ,height: 200, width: 200),

            spaziotrawidgetinaltezza(context, 30),


            GestureDetector(
                onTap: (){Navigator.pushNamed(context, RouteConstants.login);},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(Icons.arrow_back_ios, color: azzurroscuro,size: 20  ),


                    Text("Torna al Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: azzurroscuro
                      ),
                    )
                  ],
                )
            ),
          ],
        );

  }



  submit() async{
    /* String result = await loginservice.resetpassword(emailcontroller.text);
    setState(() {
      risposta = result;
    }); */
  }

}
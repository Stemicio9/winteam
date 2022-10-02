
import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/cosstanti_tema.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/texts.dart';

import '../../widgets/action_buttons.dart';
import '../../widgets/inputs.dart';



class Registrati extends StatefulWidget {
  @override
  RegistratiState createState() {
    return RegistratiState();
  }

}


class RegistratiState extends State<Registrati>{

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController nomeutentecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool switchvalue = false;   // false = Lavoratore , true = Datore

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[

                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, RouteConstants.login);},

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                      ),
                      Icon(Icons.arrow_back_ios, color: azzurroscuro,size: 40  ),
                    ],
                  ),
                ),

                spaziotrawidgetinaltezza(context, 15),

                Texth1(testo: 'REGISTRAZIONE', color: Colors.black),

                spaziotrawidgetinaltezza(context, 20),

                InputWidget(labeltext: "Email", hinttext: "email@esempio.com", controller: emailcontroller, ispassword: false ,validator: validaemail),

                spaziotrawidgetinaltezza(context,35),

                InputWidget(labeltext: "Password", hinttext: "******", controller: passwordcontroller, ispassword: true ,validator: validapassword),

                spaziotrawidgetinaltezza(context,35),

                InputWidget( labeltext: "Conferma password",hinttext: "******", controller: nomeutentecontroller, ispassword: false ,validator: defaultvalidator),

               spaziotrawidgetinaltezza(context,25),


                ActionButton("Registrati", context,registrati,250),

                spaziotrawidgetinaltezza(context, 5),

                /*    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Lavoratore", style: TextStyle(
                          color: !switchvalue ? Colors.green : Colors.black,
                          fontSize: !switchvalue ? 19 : 16
                      ),),
                      Switch(
                        value: switchvalue,
                        onChanged: (value){
                          setState(() {
                            switchvalue=value;
                          });
                        },),
                      Text("Datore di lavoro", style: TextStyle(
                          color: switchvalue ? Colors.green : Colors.black,
                          fontSize: switchvalue ? 19 : 16
                      )),
                    ],
                  ), */

              ]
          )
      )
    );
  }


  String validaemail (String value) {
    if (value.isEmpty) {
      return 'Inserire username';
    }
    if(!value.isValidEmail()){
      return "Inserire un indirizzo email valido";
    }
    return null!;
  }


  String validapassword (String value) {
    if (value.isEmpty) {
      return 'Inserire una password';
    }
    return null!;
  }



  registrati() async {
    /*  String token = await loginservice.signup(nomeutentecontroller.text,emailcontroller.text,passwordcontroller.text);
    if(token == null) {
      print("ERRORE NELLA REGISTRAZIONE");
      return; */
  }

// @todo Rifare l'operazione di registrazione su firebase

/*   FirebaseUser currentuser = await FirebaseAuth.instance.currentUser();
    UtenteCompleto utentecompleto = new UtenteCompleto(uid: currentuser.uid, email: currentuser.email,
        nomeutente: nomeutentecontroller.text, ruolo: switchvalue ? "datore" : "lavoratore",firebasemessagetoken: firebasetoken);
    var response = await loginservice.registrasuserver(utentecompleto);
    UtenteCompleto result = UtenteCompleto.fromJson(response['data']);

    if(result.ruolo == "datore") {
      Navigator.of(context).pushNamed("/dashboarddatore");
    }else {
      Navigator.of(context).pushNamed("/dashboardlavoratore");
    }

  */
/*  User? user = FirebaseAuth.instance.currentUser;
    UtenteCompleto utentecompleto = UtenteCompleto(uid: user!.uid, email: user.email,
        nomeutente: nomeutentecontroller.text, ruolo: switchvalue ? "datore" : "lavoratore",firebasemessagetoken: token);

    var response = await loginservice.registrasuserver(utentecompleto);
    UtenteCompleto result = UtenteCompleto.fromJson(response['data']);

    if(result.ruolo == "datore") {
      Navigator.of(context).pushNamed("/dashboarddatore");
    }else {
      Navigator.of(context).pushNamed("/dashboardlavoratore");
    }
  } */


}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

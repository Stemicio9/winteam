
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winteam/authentication/firebase_repository.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
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

  int switchvalue = 0;   // 0 = Lavoratore , 1 = Datore , 2 = Influencer, 3 = Admin

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

                spaziotrawidgetinaltezza(context, 15),

                Texth1(testo: 'REGISTRAZIONE', color: Colors.black),

                spaziotrawidgetinaltezza(context, 20),

                InputWidget(labeltext: "Email", hinttext: "email@esempio.com", controller: emailcontroller, ispassword: false ,validator: validaemail),

                spaziotrawidgetinaltezza(context,35),

                InputWidget(labeltext: "Password", hinttext: "******", controller: passwordcontroller, ispassword: true ,validator: validapassword),

                spaziotrawidgetinaltezza(context,35),

                InputWidget( labeltext: "Conferma password",hinttext: "******", controller: nomeutentecontroller, ispassword: false ,validator: defaultvalidator),

               spaziotrawidgetinaltezza(context,25),


                ActionButton("Registrati", context,registrati,250, azzurroscuro, Colors.white),

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

    UserCredential? user = await createUser(emailcontroller.text,passwordcontroller.text);
    if(user == null){
      // @todo la registrazione non è andata a buon fine per qualche motivo
      return;
    }

    var roleId = switchvalue == 0 ? "LAVORATORE" : "DATORE";

    // @todo chiamare la rest per creare utente anche sul server Spring

    UserListApiService;

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

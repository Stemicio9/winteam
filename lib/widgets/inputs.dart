import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';

class InputWidget extends StatelessWidget {

  final double round = 30.0;
  final String hinttext;
  final String labeltext;
  TextEditingController controller;
  var validator;
  var onchanged;
  bool ispassword = false;
  bool autofocus;
  TextInputType keyboard;
  bool? enabled = true;



  InputWidget({required hinttext,required controller, this.ispassword = false ,validator = defaultvalidator, this.labeltext = "", this.onchanged = funzionecostante, this.autofocus = false, this.keyboard = TextInputType.text, this.enabled })
      : hinttext = hinttext,
        controller = controller,
        validator = validator;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: Material(
              elevation: 7,
              color: Colors.white,
              /*       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(round)),
              ), */
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 20,top: 1, bottom: 1),
                child: TextFormField(
                //  validator: validator ?? defaultvalidator,
                  obscureText: ispassword,
                  onChanged: onchanged,
                  controller: controller,
                  keyboardType: keyboard,
                  onEditingComplete: () => node.nextFocus(),
                  enabled: enabled,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hinttext,
                      labelText: labeltext,
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: azzurroscuro),
                  ),
                ),
              ),
            ),
          )
      );
  }





}


class InputWidgetSenzaFocus extends StatelessWidget {

  final double round = 30.0;
  final String hinttext;
  final String labeltext;
  TextEditingController controller;
  var validator;
  var onchanged;
  bool ispassword = false;
  bool autofocus;
  TextInputType keyboard;

  InputWidgetSenzaFocus({@required hinttext,@required controller, this.ispassword = false ,validator = defaultvalidator, this.labeltext = "", this.onchanged = funzionecostante, this.autofocus = false, this.keyboard = TextInputType.text })
      : hinttext = hinttext,
        controller = controller,
        validator = validator;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 60,
            child: Material(
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 20,top: 1, bottom: 1),
                child: TextFormField(
                  validator: validator ?? defaultvalidator,
                  obscureText: ispassword,
                  onChanged: onchanged,
                  controller: controller,
                  keyboardType: keyboard,

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hinttext,
                      labelText: labeltext
                  ),
                ),
              ),
            ),
          )
      );
  }





}



void funzionecostante(String into){}

String defaultvalidator (String text) {
  return "";
}

String defaultvalidatornonvuoto(String text){
  if(text.isEmpty){
    return "Inserire un valore!";
  }
  return "";
}
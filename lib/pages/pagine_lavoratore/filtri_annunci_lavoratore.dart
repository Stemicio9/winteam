

import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';

import '../../constants/colors.dart';



class FiltriAnnunci extends StatefulWidget{
  @override
  FiltriAnnunciState createState() {
    return FiltriAnnunciState();
  }

}


class FiltriAnnunciState extends State<FiltriAnnunci>{

  TextEditingController stipendiocontroller = TextEditingController();

  AnnunciCubit get _cubit => context.read<AnnunciCubit>();


  List<bool> isSelected = [false,false,false,false];

  FiltriAnnunciState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appbarSenzaActions(context,'Filtri'),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:   Column(
            children: [
              Expanded(
                flex: 1,
                child: rigastipendio(),
              ),
              Expanded(
                  flex: 1,
                  child: SliderStipendio()
              ),
              Expanded(
                flex: 1,
                child: rigadistanza(),
              ),
              Expanded(
                flex: 1,
                child: SliderDistanza(),
              ),
              Expanded(
                flex: 1,
                child: rigaorario(),
              ),
              Expanded(
                flex: 1,
                child: oraributtons(),
              ),
              Expanded(
                flex: 1,
                child: rigadata(),
              ),
              Expanded(
                flex: 2,
                child: FormData(),
              ),
              Expanded(
                  flex: 1,
                  child: ActionButton("Applica", context, (){
                    compileHourSlotFilter();
                    _cubit.fetchAnnunciLavoratore(0, 20);
                    Navigator.pop(context);
                  }, 150, azzurroscuro, Colors.white)
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        )

    );
  }


  void compileHourSlotFilter(){
    filterAnnunciLavoratore.fasceOrarie = List.empty(growable: true);
    for(var i = 0; i < isSelected.length; i++){
      if(isSelected[i]){
        filterAnnunciLavoratore.fasceOrarie!.add(filterHourSlotToSend[i]);
      }
    }
  }


  Widget rigastipendio(){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("Paga minima:", style: TextStyle(fontSize: 20)
            ),

          ],
        ),
      ),
    );
  }

  Widget rigaorario(){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("Fascia oraria:", style: TextStyle(fontSize: 20)
            ),
          ],
        ),
      ),
    );
  }
  Widget rigadistanza(){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("Distanza massima:", style: TextStyle(fontSize: 20)
            ),
          ],
        ),
      ),
    );
  }
  Widget rigadata(){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("Data:", style: TextStyle(fontSize: 20)
            ),
          ],
        ),
      ),
    );
  }


  Widget oraributtons() {
    Widget buttons = ToggleButtons(
      children: <Widget>[
        PulsanteOrari(testo: "Mattina" , icona:  Icon(Icons.brightness_low_rounded, color: giallochiaro)),
        PulsanteOrari(testo: "Pomeriggio", icona:  Icon(Icons.brightness_7_rounded, color: giallo)),
        PulsanteOrari(testo: "  Sera  ", icona:  Icon(Icons.brightness_medium_rounded, color: arancio)),
        PulsanteOrari(testo: " Notte ", icona:  Icon(Icons.brightness_4_rounded, color: blunotte)),
      ],
      onPressed: (int index) {
        int count = 0;
        for (var val in isSelected) {
          if (val) count++;
        }

        setState(() {
          isSelected[index] = !isSelected[index];
        });
      },
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(10),


    );

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 16,
              child: buttons,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        )
      ],
    );
  }
}



class PulsanteOrari extends StatelessWidget {

  String? testo;
  Icon? icona;

  PulsanteOrari({this.testo,this.icona});

  @override
  Widget build(BuildContext context) {
    return
      Container(

          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container()
                  ),
                  Expanded(
                      flex: 1,
                      child: icona!
                  ),
                  Expanded(
                      flex: 2,
                      child: Container()
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(testo!, style: const TextStyle(color: azzurroscuro, fontWeight: FontWeight.w700),),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container()
                  ),
                ],
              )
            ],
          )
      );
  }

}










class FormData extends StatefulWidget {
  @override
  FormDataState createState() => FormDataState();
}

GlobalKey<FormState> myFormKey = new GlobalKey();

class FormDataState extends State<FormData> {



  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              SafeArea(
                child: DateRangeField(
                    enabled: true,
                    initialValue: filterAnnunciLavoratore.dateRange,
                    decoration: InputDecoration(
                      labelText: 'Seleziona data',
                      prefixIcon: Icon(Icons.date_range),
                      hintText: 'Please select a start and end date',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.start.isBefore(DateTime.now())) {
                        return 'Please enter a later start date';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print("IL VALORE SELEZIONATO");
                      print(value);
                      filterAnnunciLavoratore.dateRange = value!;
                    },
                    onSaved: (value) {

                    }),
              ),
            ],
          );
  }
}




class SliderDistanza extends StatefulWidget {
  const SliderDistanza({Key? key}) : super(key: key);

  @override
  State<SliderDistanza> createState() => SliderDistanzaState();
}

class SliderDistanzaState extends State<SliderDistanza> {


  @override
  Widget build(BuildContext context) {
    return Slider(
      value: filterAnnunciLavoratore.distanzaMassima ?? 0,
      max: 100,
      divisions: 100,
      label:  filterAnnunciLavoratore.distanzaMassima != null ?  "${filterAnnunciLavoratore.distanzaMassima!.round()} €" : "",
      onChanged: (double value) {
        setState(() {
          filterAnnunciLavoratore.distanzaMassima = value;
        });
      },
    );
  }
}


class SliderStipendio extends StatefulWidget {
  const SliderStipendio({Key? key}) : super(key: key);

  @override
  State<SliderStipendio> createState() => SliderStipendioState();
}

class SliderStipendioState extends State<SliderStipendio> {


  @override
  Widget build(BuildContext context) {
    return Slider(
      value: filterAnnunciLavoratore.pagaMinima ?? 0,
      max: 200,
      divisions: 200,
      label: filterAnnunciLavoratore.pagaMinima != null ?  "${filterAnnunciLavoratore.pagaMinima!.round()} €" : "",
      onChanged: (double value) {
        setState(() {
          filterAnnunciLavoratore.pagaMinima = value;
        });
      },
    );
  }
}
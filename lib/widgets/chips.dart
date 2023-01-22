import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/constants/colors.dart';

class ChipsWidget extends StatefulWidget{

  @override
  State<ChipsWidget> createState() => ChipsWidgetState();
}

class ChipsWidgetState extends State<ChipsWidget>{

  AnnunciCubit get _cubit => context.read<AnnunciCubit>();

  late int defaultChoiceIndex;
  final List<String> _choicesList = ['Tutti', 'In Corso', 'Accettati', 'Storico'];
  final List<String> _choicesListQuery = ['all', 'current', 'accepted', 'history'];

  //accettati lavoratore -> se lavoratore è matched e la data attuale è inferiore a quella dell'annuncio
  //storico lavoratore -> tutti annunci in cui lavoratore è candidato e data attuale è maggiore a quella dell'annuncio
  //in corso -> annunci in cui lavoratore è candidato e data attuale è inferiore a quella dell'annuncio

  @override
  void initState() {
    super.initState();
    defaultChoiceIndex = 0;
    _cubit.fetchAnnuncis(_choicesListQuery[defaultChoiceIndex]);
  }

  @override
  Widget build(BuildContext context) {
   return Wrap(
     spacing: 15,
     children: List.generate(_choicesList.length, (index) {
       return ChoiceChip(
         backgroundColor: Colors.white,
         labelPadding: const EdgeInsets.only(right: 10,left: 10,top: 4,bottom: 4),
         label: Text(_choicesList[index]),
         selected: defaultChoiceIndex == index,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
             side: const BorderSide(color: azzurroscuro)
         ),
         selectedColor: azzurroscuro,
         labelStyle: TextStyle(
           color: defaultChoiceIndex == index ? Colors.white : azzurroscuro,
           fontWeight: FontWeight.normal
         ),
         onSelected: (value) {
           filterAnnunciLavoratore.state = _choicesListQuery[index];
           //_cubit.fetchAnnunciLavoratore(0, 20);
           setState(() {
             defaultChoiceIndex = value ? index : defaultChoiceIndex;
           });
         },
         // backgroundColor: color,
       );
     }),
   );
  }
}


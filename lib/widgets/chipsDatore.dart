import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/constants/colors.dart';
class ChipsDatoreWidget extends StatefulWidget{

  @override
  State<ChipsDatoreWidget> createState() => ChipsDatoreWidgetState();
}

class ChipsDatoreWidgetState extends State<ChipsDatoreWidget>{

  AnnunciCubit get _cubit => context.read<AnnunciCubit>();

  late int defaultChoiceIndex;
  List<String> _choicesList = ['Tutti', 'Attivi', 'Accettati', 'Storico'];
  List<String> _choicesListQuery = ['all', 'active', 'accepted', 'history'];


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
          backgroundColor: azzurroscuromoltoopaco,
          labelPadding: const EdgeInsets.only(right: 15,left: 15,top: 4,bottom: 4),
          label: Text(
              _choicesList[index]
          ),
          selected: defaultChoiceIndex == index,
          shape: const StadiumBorder(
              side: BorderSide(
                  color: azzurroscuro)
          ),
          selectedColor: azzurroscuro,
          labelStyle: TextStyle(
            color: defaultChoiceIndex == index ? Colors.white : azzurroscuro,
          ),
          onSelected: (value) {
            _cubit.fetchAnnuncis(_choicesListQuery[index]);
            setState(() {
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
          // backgroundColor: color,
          elevation: 1,
        );
      }),
    );
  }
}


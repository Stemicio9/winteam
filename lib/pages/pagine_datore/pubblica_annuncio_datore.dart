import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:intl/intl.dart';
import '../../constants/StateConstants.dart';
import '../../constants/colors.dart';
import '../../entities/skill_entity.dart';
import '../../widgets/appbars.dart';


class PubblicaAnnuncioDatore extends StatefulWidget {
  @override
  State<PubblicaAnnuncioDatore> createState() => PubblicaAnnuncioDatoreState();
}

class PubblicaAnnuncioDatoreState extends State<PubblicaAnnuncioDatore> {
  SkillCubit get _cubit => context.read<SkillCubit>();
  DatePicker datePicker = DatePicker();
  ChipsWidget hourSlotSelector = ChipsWidget();
  String title = "";
  String description = "";
  String paymentAmount = "";


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Expanded(
            child: Column(
      children: [
        MaterialButton(
            child: Text("Scegli lista Skills"),
            onPressed: goToSelectSkill),
        Text(_cubit.selectedEntities[0].name.toString()), //Prova per mostrare la skill selezionata (rimuovere per testare)
        datePicker,
        hourSlotSelector,
        getTitleWidget(),
        getDescriptionWidget(),
        getPaymentAmount(),
        ElevatedButton(
            child: Text("Crea Annuncio"),
            onPressed: null)
      ],
    )));
  }

  void goToSelectSkill() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SelectSkillPage()))
        .then((value) => setState(() {}));
  }


  Widget getTitleWidget() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (text) {
            title = text;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                  width: 30,
                )),
            labelText: 'Titolo',
          ),
        ));
  }

  Widget getDescriptionWidget() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: null,
          onChanged: (text) {
            description = text;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                  width: 30,
                )),
            labelText: 'Descrizione',
          ),
        ));
  }

  Widget getPaymentAmount() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (text) {
          paymentAmount = text;
        },
        decoration: InputDecoration(labelText: 'Importo pagamento'),
        inputFormatters: <TextInputFormatter>[
          CurrencyTextInputFormatter(
            locale: 'it',
            decimalDigits: 2,
            symbol: '€ ',
          ),
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class SelectSkillPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectSkillPageState();
  }
}

class SelectSkillPageState extends State<SelectSkillPage> {
  SkillCubit get _cubit => context.read<SkillCubit>();

  List<SkillEntity> selectedSkills = List<SkillEntity>.empty(growable: true);

  @override
  void initState() {
    callRestWithout();
    super.initState();
  }

  void callRestWithoutFiltered(String filtro) {
    if (filtro.isEmpty) {
      callRestWithout();
      return;
    }
    Filter filter = Filter();
    filter.filterOr = "name|like_insensitive|$filtro|string";
    filter.filterOr =
        "${filter.filterOr}&firstName|like_insensitive|$filtro|string";
    filter.filterOr =
        "${filter.filterOr}&lastName|like_insensitive|$filtro|string";
    _cubit.getSkillListByFilter(filter);
  }

  void callRestWithout() {
    _cubit.getSkillListByFilter(Filter());
  }

  @override
  Widget build(BuildContext context) {
    selectedSkills = _cubit.selectedEntities;
    return Scaffold(
      appBar: appbarSenzaActions(context, "Cerca Mansione"),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              onChanged: (newValue) {
                callRestWithoutFiltered(newValue);
              },
            ),
            BlocBuilder<SkillCubit, SkillState>(builder: (_, state) {
              if (state is SkillListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SkillListLoaded) {
                return skillList(state.skillList);
              } else if (state is SkillListEmpty) {
                // @todo insert an empty state element
                return Container();
              } else {
                return const Center(child: Text('Errore di caricamento'));
              }
            }),
          ],
        ),
      ),
    );
  }

  bool contained(id) {
    for (var e in selectedSkills) {
      if (e.id == id) return true;
    }
    return false;
  }

  Widget skillList(List<SkillEntity> skillList) {
    List<SkillEntity> skillListDef =
        skillList.where((e) => !contained(e.id)).toList();

    return Expanded(
        child: Container(
            child: Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: selectedSkills.length,
              itemBuilder: (context, index) {
                return Container(
                    child: Dismissible(
                  child: Text(selectedSkills[index].name ?? ""),
                  onDismissed: (direction) {
                    print("DIREZIONE");
                    print(direction);
                    if (direction == DismissDirection.startToEnd) {
                      setState(() {
                        selectedSkills.removeAt(index);
                      });
                    }
                  },
                  key: Key(selectedSkills[index].id.toString()),
                ));
              })),
      Divider(
        height: 20,
        thickness: 5,
        indent: 20,
        endIndent: 0,
        color: Colors.redAccent,
      ),
      Expanded(
          child: ListView.builder(
              itemCount: skillListDef.length,
              itemBuilder: (context, index) {
                return Container(
                    child: GestureDetector(
                  child: Text(skillListDef[index].name ?? ""),
                  onTap: () {
                    setState(() {
                      selectedSkills.add(skillListDef[index]);
                    });
                  },
                ));
              })),
      ElevatedButton(
        onPressed: () {
          _cubit.selectedEntities = selectedSkills;
          Navigator.pop(context);
        },
        child: Text("Fine"),
      ),
    ])));
  }
}

class DatePicker extends StatefulWidget {
  TextEditingController dateInput = TextEditingController()..text = "";

  @override
  State<StatefulWidget> createState() {
    return _DatePicker();
  }
}

class _DatePicker extends State<DatePicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.width / 3,
        child: Center(
            child: TextField(
          controller: widget.dateInput,
          //editing controller of this TextField
          decoration: InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
              labelText: "Enter Date" //label text of field
              ),
          readOnly: true,
          //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                locale: const Locale('en', ''),
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate = DateFormat('yyyy-MM-dd').format(
                  pickedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                widget.dateInput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {}
          },
        )));
  }
}

class ChipsWidget extends StatefulWidget {
  String hourSlotSelected = "";

  @override
  State<ChipsWidget> createState() => ChipsWidgetState();
}

class ChipsWidgetState extends State<ChipsWidget> {
  late int defaultChoiceIndex;
  List<String> _choicesList = ['Mattina', 'Pomeriggio', 'Sera', 'Notte'];

  @override
  void initState() {
    super.initState();
    defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      children: List.generate(_choicesList.length, (index) {
        return ChoiceChip(
          backgroundColor: Colors.white,
          labelPadding:
              const EdgeInsets.only(right: 10, left: 10, top: 4, bottom: 4),
          label: Text(_choicesList[index]),
          selected: defaultChoiceIndex == index,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: azzurroscuro)),
          selectedColor: azzurroscuro,
          labelStyle: TextStyle(
              color: defaultChoiceIndex == index ? Colors.white : azzurroscuro,
              fontWeight: FontWeight.normal),
          onSelected: (value) {
            setState(() {
              widget.hourSlotSelected = _choicesList[index];
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
          // backgroundColor: color,
        );
      }),
    );
  }
}

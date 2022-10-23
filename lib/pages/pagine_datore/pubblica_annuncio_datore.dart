import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';
import 'package:intl/intl.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/widgets/texts.dart';
import '../../constants/StateConstants.dart';
import '../../constants/colors.dart';
import '../../entities/skill_entity.dart';
import '../../widgets/appbars.dart';
import '../../widgets/skill_chip.dart';

class PubblicaAnnuncioDatore extends StatefulWidget {
  @override
  State<PubblicaAnnuncioDatore> createState() => PubblicaAnnuncioDatoreState();
}

class PubblicaAnnuncioDatoreState extends State<PubblicaAnnuncioDatore> {
  SkillCubit get _cubit => context.read<SkillCubit>();
  SubscriptionCubit get _cubitSub => context.read<SubscriptionCubit>();

  AnnunciCubit get _cubitAnnunci => context.read<AnnunciCubit>();
  DatePicker datePicker = DatePicker();
  ChipsWidget hourSlotSelector = ChipsWidget();
  String title = "";
  String description = "";
  String paymentAmount = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cubitSub.cani(WHAT_CREATE_ADVERTISEMENT);
    return SingleChildScrollView(
        child: Expanded(
            child: Column(
      children: [

        SizedBox(
          height: 5,
        ),
        BlocBuilder<SubscriptionCubit, SubscriptionState>(
            builder: (_, state) {

              if (state is SubscriptionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SubscriptionCanI) {
               return canIPart();
              } else if (state is SubscriptionCannotI) {
                // @todo in questa sezione dobbiamo inserire un banner che indica che l'utente non è abilitato per questa operazione
                return Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    height: 90,
                    decoration: BoxDecoration(
                        color: rossoopaco,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Texth5(
                      testo: "IL TUO ABBONAMENTO NON TI PERMETTE DI PUBBLICARE ANNUNCI, AGGIORNA IL TUO ABBONAMENTO",
                      color: Colors.white,
                    )

                );
              } else {
                return const Center(child: Text("Non riesco a caricare i dati dell'abbonamento"));
              }
            }),


      ],
    )));
  }


  Widget canIPart(){
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        MaterialButton(
            child: (_cubit.selectedEntity.name != null &&
                _cubit.selectedEntity.name!.isNotEmpty)
                ? SkillChip(
              skillName: _cubit.selectedEntity.name!,
              hexColorText: _cubit.selectedEntity.hexColorText!,
              hexColorBackground:
              _cubit.selectedEntity.hexColorBackground!,
              imageLink: _cubit.selectedEntity.imageLink!,
            )
                : SkillChip(
              skillName: "NESSUNA MANSIONE SELEZIONATA",
              hexColorText: "0000ff",
              hexColorBackground: 'ffffff',
              imageLink: '',
            ),
            onPressed: goToSelectSkill),
        datePicker,
        hourSlotSelector,
        getTitleWidget(),
        getDescriptionWidget(),
        getPaymentAmount(),
        ElevatedButton(child: Text("Crea Annuncio"), onPressed: publishAnnuncio)
      ],
    );
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

  void publishAnnuncio() {
    print("STAMPO LA DATA");
    print(paymentAmount);
    var finalPrice = paymentAmount.replaceAll(RegExp(r'[^0-9,]'), '');
    finalPrice = finalPrice.replaceAll(',', '.');
    print(finalPrice);
    AnnunciEntity annuncio = AnnunciEntity(
        id: "",
        title: title,
        description: description,
        date: datePicker.pickedDate!.toIso8601String(),
        hourSlot: hourSlotSelector.hourSlotSelected,
        skillId: _cubit.selectedEntity.id!,
        payment: finalPrice,
        skillDTO: SkillEntity(),
        publisherUserId: "",
        candidateUserList: [],
        matchedUserId: "",
        advertisementStatus: "");

    _cubitAnnunci.publishAnnuncio(annuncio);
    _cubit.selectedEntity = SkillEntity();
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
      /*   Expanded(
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
              })
      ), */
      /*    Divider(
        height: 20,
        thickness: 5,
        indent: 20,
        endIndent: 0,
        color: Colors.redAccent,
      ), */
      Expanded(
          child: ListView.builder(
              itemCount: skillListDef.length,
              itemBuilder: (context, index) {
                return Container(
                    child: GestureDetector(
                  child: ListTile(
                    title: Text(skillListDef[index].name ?? ""),
                  ),
                  // Text(skillListDef[index].name ?? ""),
                  onTap: () {
                    setState(() {
                      _cubit.selectedEntity = skillListDef[index];
                      selectedSkills.add(skillListDef[index]);
                    });
                    Navigator.pop(context);
                  },
                ));
              })),
      /*  ElevatedButton(
        onPressed: () {
         // _cubit.selectedEntities = selectedSkills;
          Navigator.pop(context);
        },
        child: Text("Fine"),
      ), */
    ])));
  }
}

class DatePicker extends StatefulWidget {
  TextEditingController dateInput = TextEditingController()..text = "";
  DateTime? pickedDate;

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
              /*     String formattedDate = DateFormat('yyyy-MM-dd').format(
                  pickedDate);
              setState(() {
                widget.dateInput.text =
                    formattedDate;
              }); */
              setState(() {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                widget.dateInput.text = formattedDate;
                widget.pickedDate = pickedDate;
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

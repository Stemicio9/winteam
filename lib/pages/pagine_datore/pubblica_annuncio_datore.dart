import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/skill_bloc/skill_cubit.dart';

import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/chips_hour.dart';
import 'package:winteam/widgets/date_picker.dart';
import 'package:winteam/widgets/select_skill_page.dart';
import 'package:winteam/widgets/skill_chip.dart';
import 'package:winteam/widgets/texts.dart';

class PubblicaAnnuncioDatore extends StatefulWidget {
  @override
  State<PubblicaAnnuncioDatore> createState() => PubblicaAnnuncioDatoreState();
}

class PubblicaAnnuncioDatoreState extends State<PubblicaAnnuncioDatore> {
  SkillCubit get _cubit => context.read<SkillCubit>();
  SubscriptionCubit get _cubitSub => context.read<SubscriptionCubit>();

  AnnunciCubit get _cubitAnnunci => context.read<AnnunciCubit>();
  DatePicker datePicker = DatePicker();
  ChipsWidgetHour hourSlotSelector = ChipsWidgetHour();
  String title = "";
  String description = "";
  String paymentAmount = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController dataController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController pagamentoController = TextEditingController();


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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          MaterialButton(
              onPressed: goToSelectSkill,
              child: (_cubit.selectedEntity.name != null && _cubit.selectedEntity.name!.isNotEmpty)
                  ? SkillChip(
                skillName: _cubit.selectedEntity.name!,
                hexColorText: _cubit.selectedEntity.hexColorText!,
                hexColorBackground: _cubit.selectedEntity.hexColorBackground!,
                imageLink: _cubit.selectedEntity.imageLink!,
              )
                  : SkillChip(
                skillName: "Nessuna mansione selezionata",
                hexColorText: "0000ff",
                hexColorBackground: 'ffffff',
                imageLink: 'assets/images/avatar_image.png',
              )),
          datePicker,
          hourSlotSelector,
          getTitleWidget(),
          getDescriptionWidget(),
          getPaymentAmount(),
          ActionButton('Crea annuncio', publishAnnuncio, 150, azzurroscuro, Colors.white),
        ],
      )
    ) ;
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  width: 30,
                )),
            labelText: 'Titolo',
          ),
        ));
  }

  Widget getDescriptionWidget() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          minLines: 4,
          maxLines: null,
          onChanged: (text) {
            description = text;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                width: 30,
              )),
          labelText: 'Importo pagamento',
        ),
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
        description: description,
        date: datePicker.pickedDate!.toIso8601String(),
        hourSlot: hourSlotSelector.hourSlotSelected,
        skillId: _cubit.selectedEntity.id!,
        payment: finalPrice,
        skillDTO: SkillEntity(),
        publisherUserId: "",
        candidateUserList: [],
        matchedUserId: "",
        advertisementStatus: "", position: '', image: '');

    _cubitAnnunci.publishAnnuncio(annuncio);
    _cubit.selectedEntity = SkillEntity();
  }
}
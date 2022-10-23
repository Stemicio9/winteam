import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/screens/user_list/user_list_widget.dart';
import 'package:winteam/widgets/chips.dart';
import 'package:winteam/widgets/texts.dart';

import '../../widgets/appbars.dart';

class RicercaUtenteDatore extends StatefulWidget {
  @override
  State<RicercaUtenteDatore> createState() =>RicercaUtenteDatoreState();
}



class RicercaUtenteDatoreState extends State<RicercaUtenteDatore>{

  SubscriptionCubit get _cubit => context.read<SubscriptionCubit>();


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cubit.cani(WHAT_SEARCH);
    return Container(
      child:Column(
        children: [
          BlocBuilder<SubscriptionCubit, SubscriptionState>(
              builder: (_, state) {

                if (state is SubscriptionLoading) {
                  return Container();
                } else if (state is SubscriptionCanI) {
                  // @todo in questa sezione potremo aggiungere info aggiuntive sull'attuale abbonamento
                  return Container();
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
                      testo: "IL TUO ABBONAMENTO NON TI PERMETTE DI VEDERE TUTTI I DATI DEI RISULTATI DI RICERCA, AGGIORNA IL TUO ABBONAMENTO",
                      color: Colors.white,
                    )

                  );
                } else {
                  return const Center(child: Text("Non riesco a caricare i dati dell'abbonamento"));
                }
              }),
          Expanded(child: UserListWidget())
        ],
      ),
    );
  }

}




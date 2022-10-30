import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/subscription_bloc/subscription_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/screens/user_list/user_list_widget.dart';
import 'package:winteam/widgets/texts.dart';



class RicercaUtenteDatore extends StatefulWidget {
  const RicercaUtenteDatore({super.key});

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
    return Column(
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
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    height: 90,
                    decoration: BoxDecoration(
                      color: rossoopaco,
                      borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: Texth5(
                      testo: getCurrentLanguageValue(BANNER_CANNOT_SEARCH_USER)!,
                      color: Colors.white,
                    )

                  );
                } else {
                  return Center(child: Text(getCurrentLanguageValue(CANNOT_LOAD_SUBSCRIPTION_INFO)!));
                }
              }),
          const Expanded(child: UserListWidget())
        ],
      );
  }

}




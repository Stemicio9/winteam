import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/blocs/users_matched_bloc/users_matched_cubit.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_candidato.dart';
import 'package:winteam/widgets/card_dettaglio_datore.dart';



class DettaglioAnnuncioDatoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnnunciUserListCubit(),
        ),
        BlocProvider(
        create: (context) => UsersMatchedCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        )
      ],
      child: DettaglioAnnuncioDatore(),
    );
  }

}

class DettaglioAnnuncioDatore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return DettaglioAnnuncioDatoreState();
  }

}


class DettaglioAnnuncioDatoreState extends State<DettaglioAnnuncioDatore>{

  AnnunciUserListCubit get annunciCubit => context.read<AnnunciUserListCubit>();
  UsersMatchedCubit get matchCubit => context.read<UsersMatchedCubit>();
  UserCubit get userCubit => context.read<UserCubit>();

  @override
  void initState() {
    userCubit.me();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final annuncio = ModalRoute.of(context)!.settings.arguments as AnnunciEntity;
    matchCubit.getUserMatched(annuncio.matchedUserId);

    return Scaffold(
        appBar: appbarSenzaActions(context, 'Dettaglio annuncio'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(padding: EdgeInsets.only(top: 30),),

              CardDettaglioDatore(annuncio: annuncio),

              Container(padding: EdgeInsets.only(top: 20),),

              BlocBuilder<UserCubit, UserState>(

                  builder: (_,state) {

                    print("CHE STATO HO ?");
                    print(state.toString());

                    if (state is UserLoaded) {

                      print("SONO NELLO STATE USERLOADED");
                      print(state.user.roleId);
                      if(state.user.roleId == "LAVORATORE"){
                        bool show = true;
                        if(annuncio.candidateUserList.contains(state.user.id)) {
                          show = false;
                        }
                        if(annuncio.matchedUserId.isNotEmpty){
                          show = false;
                        }
                        return ActionButton(show ? "CANDIDATI" : "NON TI PUOI CANDIDARE" ,
                                (){
                                      annunciCubit.candidate(annuncio.id ?? '');

                                  },
                            250,
                            azzurroscuro,
                            Colors.white
                        );
                      }else{
                        return ActionButton(annuncio.candidateUserList.isEmpty ? "Nessun candidato" :
                        annuncio.candidateUserList.length == 1 ? "1 candidato" :
                        "${annuncio.candidateUserList.length} candidati",
                                (){
                              if(annuncio.candidateUserList.isNotEmpty) {
                                Navigator.pushNamed(context, RouteConstants.listaCandidati, arguments: annuncio);}},
                            250,
                            azzurroscuro,
                            Colors.white
                        );
                      }
                    } else {
                      return Container();
                    }


              }),
              BlocBuilder<UsersMatchedCubit, UsersMatchedState>(
                  builder: (_, state) {
                    if (state is UsersMatchedLoading) {
                      return Container();
                    }else if(state is UsersMatchedEmpty) {
                      return Container();
                    } else if (state is UsersMatchedLoaded) {
                      return CardCandidato(user: state.user, match: true);
                    }  else {
                      return Container();
                    }
                  }),

            ],
          ),
        )


    );
  }
}

/*
class DettaglioAnnuncioDatore extends StatefulWidget{
  @override
  State<DettaglioAnnuncioDatore> createState() => DettaglioAnnuncioDatoreState();

}


class DettaglioAnnuncioDatoreState extends State<DettaglioAnnuncioDatore>{

  static const _actionTitles = ['Create Post', 'Eliminare definitivamente l\'annuncio?', 'Modifica annuncio'];

  void _showAction(BuildContext context, int index) {

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarSenzaActions(context, 'Dettaglio annuncio'),
        body: Column(
          children: [
            Container(padding: EdgeInsets.only(top: 30),),

            CardDettaglioDatore('ATTIVO'),

            Container(padding: EdgeInsets.only(top: 20),),

            ActionButton('9 candidati', context, (){Navigator.pushNamed(context, RouteConstants.listaCandidati);}, 250, azzurroscuro, Colors.white),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom:25,right: 25),
          child: ExpandableFab(
              distance: 90.0,
              children: [
                ActionButtonExpandable(
                  onPressed: () {Navigator.pushNamed(context, RouteConstants.aggiungiAnnuncio);},
                  icon:  Icon(Icons.add),
                  color: azzurroscuro,
                ),

                ActionButtonExpandable(
                  onPressed: (){showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Texth3(
                              testo:'Eliminare definitivamente l\'annuncio?',
                              color: Colors.black,
                            ),

                            actions: <Widget>[
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80.0)),
                                    side: BorderSide(
                                        width: 2,
                                        color: azzurroscuro),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Annulla',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: azzurroscuro
                                    ),
                                  )
                              ),
                              MaterialButton(
                                  onPressed: () {Navigator.pop(context);},
                                  color: rossoopaco,
                                  //   padding: EdgeInsets.all(10),

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0)),
                                  child: Text(
                                    'Elimina',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                  )
                              ),

                            ],
                          )
                  );},
                  icon:  Icon(Icons.delete_outline_rounded),
                  color: Colors.red,
                ),
                ActionButtonExpandable(
                  onPressed: () => _showAction(context, 2),
                  icon:  Icon(Icons.edit),
                  color: giallo,
                ),
              ]
          )
        )

    );
  }
}
*/

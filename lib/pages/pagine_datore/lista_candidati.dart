import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/blocs/users_matched_bloc/users_matched_cubit.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_candidato.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';


class ListaCandidatiWidget extends StatelessWidget {
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
      ],

      child: ListaCandidati(),
    );
  }

}


class ListaCandidati extends StatefulWidget{
  @override
  State<ListaCandidati> createState() => ListaCandidatiState();
}

class ListaCandidatiState extends State<ListaCandidati> {

  AnnunciUserListCubit get _cubit => context.read<AnnunciUserListCubit>();
  UsersMatchedCubit get matchCubit => context.read<UsersMatchedCubit>();


  late AnnunciEntity annuncio;

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {


     annuncio = ModalRoute.of(context)!.settings.arguments as AnnunciEntity;
    _cubit.listCandidati(annuncio.id ?? "");
    print("HO FATTO LA BUILD ");
    print(annuncio.matchedUser?.id);
    matchCubit.getUserMatched(annuncio.matchedUser?.id ?? "");

    return Scaffold(
      appBar: appbarSenzaActions(context, 'Lista candidati'),
      body: Column(
        children: [

          BlocBuilder<UsersMatchedCubit, UsersMatchedState>(
              builder: (_, state) {
                if (state is UsersMatchedLoading) {
                  return Container();
                }else if(state is UsersMatchedEmpty) {
                  return Container();
                } else if (state is UsersMatchedLoaded) {
                  return CardCandidato(user: state.user, match: false);
                }  else {
                  return Container();
                }
              }),

          Expanded(child: UserListWidget(reloadAll: reloadAll, matchUser: matchUser,)),

        ],
      )


    );
  }


  void reloadAll() async {
    await _cubit.listCandidati(annuncio.id ?? "");
    matchCubit.getUserMatched(annuncio.matchedUser?.id ?? "");
  }


  void matchUser(String userId){
    _cubit.matchUser(userId, annuncio.id ?? '');
  }



}


class UserListWidget extends StatelessWidget {


  Function reloadAll;
  Function(String)? matchUser;

  UserListWidget({required this.reloadAll, this.matchUser});

  @override
  Widget build(BuildContext context) {
     return blocSession();
  }


  Widget blocSession(){
    return  BlocBuilder<AnnunciUserListCubit, AnnunciUserListState>(
        builder: (_, state) {
          if (state is AnnunciUserListLoading) {
            return Center(child: loadingGif());
          } else if (state is AnnunciUserListLoaded) {

            return ListView.builder(
                itemCount: state.utenti.length,
                itemBuilder: (_,index) {

                    return CardCandidato(user: state.utenti[index], match: false, matchUser: matchUser,);

                });

          } else if (state is AnnunciListReloadAll){
            reloadAll();
            return Container();
          } else {
            return const Center(child: Text('Errore di caricamento'));
          }
        });
  }



}
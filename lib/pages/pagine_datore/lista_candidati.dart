import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/annunci_bloc/annunci_cubit.dart';
import 'package:winteam/blocs/annunci_user_list/annunci_user_list_cubit.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_candidato.dart';


class ListaCandidatiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnnunciUserListCubit(),
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


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    var annuncio = ModalRoute.of(context)!.settings.arguments as AnnunciEntity;
    _cubit.listCandidati(annuncio);

    print("INIZIO A COSTRUIRE LISTA CANDIDATI GRAFICA");
    return Scaffold(
      appBar: appbarSenzaActions(context, 'Lista candidati'),
      body: UserListWidget()


    );
  }




}


class UserListWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
     return blocSession();
  }


  Widget blocSession(){
    return  BlocBuilder<AnnunciUserListCubit, AnnunciUserListState>(
        builder: (_, state) {
          if (state is AnnunciUserListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AnnunciUserListLoaded) {
            print("COSTRUISCO LA LISTA DI UTENTI");
            print(state.utenti.length);

            return ListView.builder(
                itemCount: state.utenti.length,
                itemBuilder: (_,index) {

                    return CardCandidato(user: state.utenti[index]);

                });

          }  else {
            return const Center(child: Text('Errore di caricamento'));
          }
        });
  }

}
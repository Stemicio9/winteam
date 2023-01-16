

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/widgets_v2/loading_gif.dart';

class DatoreProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return DatoreProfileState();
  }

}

class DatoreProfileState extends State<DatoreProfile> {

  UserCubit get _cubit => context.read<UserCubit>();

  DatoreProfileState();


  @override
  void initState() {
    callRestWithout();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [

          SizedBox(height: 15),
          BlocBuilder<UserCubit, UserState>(
              builder: (_, state) {

                if (state is UserLoading) {
                  return Center(child: loadingGif());
                } else if (state is UserLoaded) {
                  return userProfile(state.user);
                } else if (state is UserEmpty) {
                  // @todo insert an empty state element
                  return Container();
                } else {
                  return const Center(child: Text('Errore di caricamento'));
                }
              }),
        ],
      ),
    );
  }


  void callRestWithout(){
    _cubit.me();
  }


  Widget userProfile(UserEntity userEntity){
    return Column(
      children: [
        userEntity.firstName != null ? Text("Nome: ${userEntity.firstName}") : Text("nome non inserito"),
        Text("Email: ${userEntity.email}"),
      ],
    );
  }

}
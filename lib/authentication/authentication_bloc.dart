

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/entities/user_entity.dart';

import 'firebase_repository.dart';

part 'authentication_bloc_state.dart';


class UserAuthCubit extends Cubit<UserAuthenticationState> {
  UserAuthCubit() : super(NotAuthenticated());


  login(String email, String password) async {
    emit(UserAuthenticationLoading());
    try{
      UserCredential? log = await signIn(email, password);

      if(log == null || log.user == null){
        emit(UserErrorAuthentication());
        return;
      }
      var token = await log.user!.getIdToken();
      emit(UserAuthenticated(token));
    }catch(e){
      emit(UserErrorAuthentication());
    }
  }

}

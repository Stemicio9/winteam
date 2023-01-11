
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam/entities/user_entity.dart';

part 'authentication_bloc_state.dart';


class UserAuthCubit extends Cubit<UserAuthenticationState> {
  UserAuthCubit() : super(NotAuthenticated());

  persistAuthentication(UserEntity userEntity){
    emit(UserAuthenticated(userEntity));
  }

  logout(){
    emit(NotAuthenticated());
  }
}

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/entities/user_entity.dart';


part 'users_matched_cubit_state.dart';

class UsersMatchedCubit extends Cubit<UsersMatchedState> {
  UsersMatchedCubit() : super(UsersMatchedLoading());



  void getUserMatched(String uid) async {
    emit(UsersMatchedLoading());

    print("CHIAMO I MATCHED");
    print(uid);
    if(uid == null || uid.isEmpty){
      emit(UsersMatchedEmpty());
      return;
    }
    try {

      HttpResponse<dynamic> result = await userListApiService.getUser(uid);

      var encoded = jsonEncode(result.data);
      var json = UserEntity.fromJson(jsonDecode(encoded));

      emit(UsersMatchedLoaded(json));

    } catch (e) {
      print(e.toString());
      emit(UsersMatchedError());
    }
  }

}








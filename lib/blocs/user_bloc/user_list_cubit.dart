import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/entities/user_entity.dart';

part 'user_list_cubit_state.dart';


const String DUMMY_NAME = "EGG";
const String DUMMY_EMAIL = "s.miceli90@gmail.com";

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListLoading());

  final List<UserEntity> _users = [];
  List<UserEntity> get users => _users;

  void fetchUsers() async {
    emit(UserListLoading());
    try {
      // TODO: fetch users
      // Qui bisogna creare la nostra lista
      HttpResponse<dynamic> result = await userListApiService.getUserList();

      var encoded = jsonEncode(result.data);
      print("HO ENCODATO");
      print(encoded);

      var json = (jsonDecode(encoded) as List)
          .map((data) => UserEntity.fromJson(data))
          .toList();

      emit(UserListLoaded(json));

    } catch (e) {
      print(e.toString());
      emit(UserListError());
    }
  }

  void searchUserFiltered(String search) async {
    emit(UserListLoading());
    try {
      // TODO: fetch users
      // Qui bisogna creare la nostra lista
      HttpResponse<dynamic> result = await userListApiService.searchUserFiltered(search);

      var encoded = jsonEncode(result.data);
      print("HO ENCODATO");
      print(encoded);

      var json = (jsonDecode(encoded) as List)
          .map((data) => UserEntity.fromJson(data))
          .toList();

      emit(UserListLoaded(json));

    } catch (e) {
      print(e.toString());
      emit(UserListError());
    }
  }


  void fetchUserFilteredPaged(Filter filter) async {
    emit(UserListLoading());
    try {
      // TODO: fetch users
      // Qui bisogna creare la nostra lista
      HttpResponse<dynamic> result = await userListApiService.fetchUsers(filter);

      print("la risposta");
      print(result);

      print("la risposta.data");
      print(result.data);
      var encoded = jsonEncode(result.data["items"]);
      print(encoded);
      var json = (jsonDecode(encoded) as List)
          .map((data) => UserEntity.fromJson(data))
          .toList();

      emit(UserListLoaded(json));

    } catch (e) {
      print(e.toString());
      emit(UserListError());
    }
  }



}




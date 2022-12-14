
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/entities/user_entity.dart';

part 'annunci_user_list_cubit_state.dart';


class AnnunciUserListCubit extends Cubit<AnnunciUserListState> {
  AnnunciUserListCubit() : super(AnnunciUserListLoading());


  final List<UserEntity> _utenti = [];
  List<UserEntity> get utenti => _utenti;

  Future<void> listCandidati(AnnunciEntity annuncio) async {
    emit(AnnunciUserListLoading());
    try {
      HttpResponse<dynamic> result = await annunciListApiService
          .listUserAnnuncio(annuncio);



      var encoded = jsonEncode(result.data);
      print("HO ENCODATO");
      var totalJson = jsonDecode(encoded);
      var json = (totalJson as List)
          .map((data) => UserEntity.fromJson(data))
          .toList();

      print("CIAO CIAO CIAO CIAO");
      emit(AnnunciUserListLoaded(json));
    } catch (e) {
      print(e.toString());
      emit(AnnunciUserListError());
    }
  }

  void matchUser(String userId, String advertisementId) async {
    emit(AnnunciUserListLoading());
    try {
      HttpResponse<dynamic> result = await annunciListApiService
          .matchUser(userId, advertisementId);
      emit(AnnunciListReloadAll());
    } catch (e) {
      print(e.toString());
      emit(AnnunciUserListError());
    }
  }

  Future<void> candidate(String advertisementId) async {
    emit(AnnunciUserListLoading());
    try{
      HttpResponse<dynamic> result = await annunciListApiService.candidate(advertisementId);
      emit(AnnunciListReloadAll());
    }catch(e) {
      print(e.toString());
      emit(AnnunciUserListError());
    }
  }

}
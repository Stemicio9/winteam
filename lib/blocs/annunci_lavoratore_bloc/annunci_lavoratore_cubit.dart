import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';
import 'package:winteam/entities/annunci_entity.dart';

part 'annunci_lavoratore_cubit_state.dart';

class AnnunciLavoratoreCubit extends Cubit<AnnunciLavoratoreState> {
  AnnunciLavoratoreCubit() : super(AnnunciLavoratoreLoading());

  final List<AnnunciEntity> _annunci = [];

  List<AnnunciEntity> get annunci => _annunci;

  void fetchAnnunciLavoratore(String state, int page, int size) async {
    emit(AnnunciLavoratoreLoading());
    try {
      HttpResponse<dynamic> result = await annunciListApiService
          .getAnnunciPagedForApplicant(state, page, size);
      print(result.data['items']);
      var encoded = jsonEncode(result.data['items']);
      print(encoded);
      var json = (jsonDecode(encoded) as List)
          .map((data) => AnnunciEntity.fromJson(data))
          .toList();

      if (json.isEmpty) {
        emit(AnnunciLavoratoreEmpty());
      } else {
        emit(AnnunciLavoratoreLoaded(json));
      }
    } catch (e) {
      print(e.toString());
      emit(AnnunciLavoratoreError());
    }
  }
}

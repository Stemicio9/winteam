import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';
import 'package:winteam/entities/annunci_entity.dart';



part 'annunci_cubit_state.dart';


const String DUMMY_NAME = "EGG";
const String DUMMY_EMAIL = "s.miceli90@gmail.com";

class AnnunciCubit extends Cubit<AnnunciState> {
  AnnunciCubit() : super(AnnunciLoading());

  final List<AnnunciEntity> _annuncis = [];
  List<AnnunciEntity> get annuncis => _annuncis;

  void fetchAnnuncis() async {
    emit(AnnunciLoading());
    try {
      // TODO: fetch Annuncis
      // Qui bisogna creare la nostra a
      HttpResponse<dynamic> result = await annunciListApiService.getAnnunciList();

      var encoded = jsonEncode(result.data);
      var json = (jsonDecode(encoded) as List)
          .map((data) => AnnunciEntity.fromJson(data))
          .toList();

      emit(AnnunciLoaded(json));

    } catch (e) {
      print(e.toString());
      emit(AnnunciError());
    }
  }



 

}



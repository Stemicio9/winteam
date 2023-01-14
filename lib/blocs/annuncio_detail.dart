
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';
import 'package:winteam/entities/annunci_entity.dart';



class AnnuncioDetailCubit extends Cubit<AnnuncioDetailState> {
  AnnuncioDetailCubit() : super(AnnuncioDetailLoading());



  // Get annuncio by id
  Future<AnnunciEntity> getAnnuncioById(String id) async {
    emit(AnnuncioDetailLoading());
    try{
      HttpResponse<dynamic> result = await annunciListApiService.getAnnuncio(id);
      var json =  AnnunciEntity.fromJson(result.data);
      emit(AnnuncioDetailLoaded(json));
      return json;
    }catch(e) {
      print(e.toString());
      emit(AnnuncioDetailError());
      return AnnunciEntity.defaultVal();
    }
  }


}



@immutable
abstract class AnnuncioDetailState {}

class AnnuncioDetailLoading extends AnnuncioDetailState {}
class AnnuncioDetailLoaded extends AnnuncioDetailState {
  final AnnunciEntity annuncio;
  AnnuncioDetailLoaded(this.annuncio);
}
class AnnuncioDetailError extends AnnuncioDetailState {}



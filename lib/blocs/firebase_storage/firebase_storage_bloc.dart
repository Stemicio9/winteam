import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/blocs/firebase_storage/firebase_storage_service.dart';

class FirebaseStorageCubit extends Cubit<FirebaseStorageState> {
  FirebaseStorageCubit() : super(FirebaseStorageNothing());

  persistImageUrl(String imageUrl) {
    emit(FirebaseStorageLoaded(imageUrl));
  }

  Future saveImageToFirebase(XFile imageFile, String uid) async {
    emit(FirebaseStorageLoading());
    try{
      print("STO PER SALVARE IMMAGINE IN FIREBASE");
      String result = await firebaseStorageService.saveDataToFirebase(imageFile, uid);
      print("HO FATTO UPLOAD SU FIREBASE, ORA MI PRENDO URL");
      String finalResult = await firebaseStorageService.downloadUrlImage(uid);
      print("HO PRESO URL IMAGE : $finalResult");



      emit(FirebaseStorageLoaded(finalResult, toUpload: true));
    }catch(e){
      emit(FirebaseStorageError());
    }
  }

  uploaded(String imageUrl){
    emit(FirebaseStorageLoaded(imageUrl));
  }

  clear(){
    emit(FirebaseStorageNothing());
  }


}


@immutable
abstract class FirebaseStorageState {}

class FirebaseStorageNothing extends FirebaseStorageState {}

class FirebaseStorageLoading extends FirebaseStorageState {}

class FirebaseStorageLoaded extends FirebaseStorageState {
  final String imageUrl;
  final bool toUpload;
  FirebaseStorageLoaded(this.imageUrl, {this.toUpload = false});
}

class FirebaseStorageError extends FirebaseStorageState {}




import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winteam/constants/language.dart';

FirebaseStorageService firebaseStorageService = FirebaseStorageService();

class FirebaseStorageService {


  Future downloadUrlImage(String uid) async {

    var fileList =
    await FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll();

    print("LA LISTA INTERA DEI FILE DI $uid");
     for (var element in fileList.items) {
       print(element.name);
     }

    if (fileList.items.isEmpty) {
      print("NON CI SONO FILE NELLA LISTA");
      var fileList = await FirebaseStorage.instance
          .ref('default_profile_image/')
          .listAll();
      var file = fileList.items[0];
      var result = await file.getDownloadURL();
      return result;
    }

    print("CI SONO FILE NELLA LISTA");

    var file = fileList.items[0];
    var result = await file.getDownloadURL();

    print("HO APPENA PESCATO IMMAGINE DI UTENTE $uid");
    print("URL IMMAGINE = $result");

    return result;
  }

  Future saveDataToFirebase(XFile imageFile, String uid) async {
    print("SONO NEL METODO SAVEDATATOFIREBASE, PRENDO IL FILE");
    var file = File(imageFile.path);

    Uint8List bytes = file.readAsBytesSync();

    var fileList =
        await FirebaseStorage.instance.ref('UID:$uid/image_profile/').listAll();
    if (fileList.items.isNotEmpty) {
      var fileesistente = fileList.items[0];
      fileesistente.delete();
    }

    print("HO ELIMINATO EVENTUALI ALTRI FILE");
    var reference = await FirebaseStorage.instance
        .ref('UID:$uid/image_profile/${imageFile.name}')
        .putData(bytes);

    return "FINITO";

  }



}
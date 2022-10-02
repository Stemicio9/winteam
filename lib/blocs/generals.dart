


import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GeneralDio {

  late Dio dio;


  GeneralDio(){
    dio = Dio();
  }




  addHeaderToken() async {
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };

  }

}

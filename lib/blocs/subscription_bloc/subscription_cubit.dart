import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/entities/subscription.dart';



part 'subscription_cubit_state.dart';


const String DUMMY_NAME = "EGG";
const String DUMMY_EMAIL = "s.miceli90@gmail.com";

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionLoading());

  final Subscription _subscription = Subscription();
  Subscription get subscription => _subscription;

  void cani(String query) async {
    emit(SubscriptionLoading());
    try {
      HttpResponse<dynamic> result = await userListApiService.canI(query);

      print("LA RISPOSTA ALLA REST ");
      print(result.response);

      var encoded = jsonEncode(result.data);

      var json = jsonDecode(encoded);
      if(json["response"]){
        emit(SubscriptionCanI());
      }else{
        emit(SubscriptionCannotI());
      }


    } catch (e) {
      print(e.toString());
      emit(SubscriptionError());
    }
  }





}




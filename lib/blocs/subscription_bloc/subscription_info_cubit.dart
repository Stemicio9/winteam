
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/dio.dart';
import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/entities/subscription.dart';

part 'subscription_info_cubit_state.dart';



class SubscriptionInfoCubit extends Cubit<SubscriptionInfoState> {
  SubscriptionInfoCubit() : super(SubscriptionInfoLoading());

  final Subscription _subscription = Subscription();
  Subscription get subscription => _subscription;

  void mySubscription(String uid) async {
    emit(SubscriptionInfoLoading());
    try {
      HttpResponse<dynamic> result = await userListApiService.mySubscription(uid);

      var encoded = jsonEncode(result.data);

      var json = jsonDecode(encoded);
      var sub = Subscription.fromJson(json);
      emit(SubscriptionInfoLoaded(sub));

    } catch (e) {

      emit(SubscriptionInfoError());
    }
  }





}

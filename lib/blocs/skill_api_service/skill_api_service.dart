import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:winteam/blocs/annunci_api_service/annunci_api_service.dart';

import '../../constants/StateConstants.dart';


part  'skill_api_service_impl.dart';

@RestApi()
abstract class SkillListApiService {
  factory SkillListApiService(Dio dio, {String baseUrl}) =
  _SkillListApiService;

  @GET('/skill/list/filter')
  Future<HttpResponse<dynamic>> getSkillListByFilter(Filter filters);

}
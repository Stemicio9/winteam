import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/main.dart';

part  'skill_api_service_impl.dart';

@RestApi()
abstract class SkillListApiService {
  factory SkillListApiService(Dio dio, {String baseUrl}) =
  _SkillListApiService;

  @GET('/skill/list/filter')
  Future<HttpResponse<dynamic>> getSkillListByFilter(Filter filters);

  @GET('/skill/list/all')
  Future<HttpResponse<dynamic>> getSkillList();

}
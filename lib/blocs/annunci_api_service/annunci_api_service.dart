
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/main.dart';

part  'annunci_api_service_impl.dart';

@RestApi()
abstract class AnnunciListApiService {
  factory AnnunciListApiService(Dio dio, {String baseUrl}) =
  _AnnunciListApiService;

  @GET('/advertisement/list/owner')
  Future<HttpResponse<dynamic>> getAnnunciList(String query);

  @GET('/advertisement/page')
  Future<HttpResponse<dynamic>> getAnnunciPaged(Map<String,dynamic> queryParameters, String state);

  @GET('/advertisement/page/applicant')
  Future<HttpResponse<dynamic>> getAnnunciPagedForApplicant(String state, int page, int size);

  @POST('/advertisement/create')
  Future<HttpResponse<dynamic>> publishAnnuncio(AnnunciEntity annuncio);

  @GET('/advertisement/list/users')
  Future<HttpResponse<dynamic>> listUserAnnuncio(String annuncioid);

  @POST('/advertisement/match')
  Future<HttpResponse<dynamic>> matchUser(String userId, String advertisementId);

  @POST('/advertisement/canditate')
  Future<HttpResponse<dynamic>> candidate(String advertisementId);

  @GET('/advertisement/list/:id')
  Future<HttpResponse<dynamic>> getAnnuncio(String id);

  @GET('/advertisement/list/skill')
  Future<HttpResponse<dynamic>> getAnnuncioBySkill(String skill);

}


import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/entities/annunci_entity.dart';

part  'annunci_api_service_impl.dart';

@RestApi()
abstract class AnnunciListApiService {
  factory AnnunciListApiService(Dio dio, {String baseUrl}) =
  _AnnunciListApiService;

  @GET('/advertisement/list/owner')
  Future<HttpResponse<dynamic>> getAnnunciList(String query);

  @GET('/advertisement/page')
  Future<HttpResponse<dynamic>> getAnnunciPaged(int page, int size);

  @POST('/advertisement/create')
  Future<HttpResponse<dynamic>> publishAnnuncio(AnnunciEntity annuncio);

  @GET('/advertisement/list/users')
  Future<HttpResponse<dynamic>> listUserAnnuncio(AnnunciEntity annuncio);



}

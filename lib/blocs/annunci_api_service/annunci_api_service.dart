
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/retrofit.dart';

part  'annunci_api_service_impl.dart';

@RestApi()
abstract class AnnunciListApiService {
  factory AnnunciListApiService(Dio dio, {String baseUrl}) =
  _AnnunciListApiService;

  @GET('/annunci')
  Future<HttpResponse<dynamic>> getAnnunciList();




}

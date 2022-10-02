
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part  'user_api_service_impl.dart';

@RestApi()
abstract class UserListApiService {
  factory UserListApiService(Dio dio, {String baseUrl}) =
  _UserListApiService;

  @GET('/users')
  Future<HttpResponse<dynamic>> getUserList();

  @GET('/me')
  Future<HttpResponse<dynamic>> me();
}


import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam/constants/StateConstants.dart';

part  'user_api_service_impl.dart';

@RestApi()
abstract class UserListApiService {
  factory UserListApiService(Dio dio, {String baseUrl}) =
  _UserListApiService;

  @GET('/users')
  Future<HttpResponse<dynamic>> getUserList();

  @GET('/user/me')
  Future<HttpResponse<dynamic>> me();

  @GET('/user/list/{uid}')
  Future<HttpResponse<dynamic>> getUser(String uid);

  @GET('/user/page')
  Future<HttpResponse<dynamic>> fetchUsers(Filter filters);

  @GET('/user/register')
  Future<HttpResponse<dynamic>> register(String role);

  @GET('/user/cani')
  Future<HttpResponse<dynamic>> canI(String query);

}

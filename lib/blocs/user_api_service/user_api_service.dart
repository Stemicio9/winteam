
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam/constants/StateConstants.dart';
import 'package:winteam/entities/user_entity.dart';
import 'package:winteam/main.dart';

part  'user_api_service_impl.dart';

@RestApi()
abstract class UserListApiService {
  factory UserListApiService(Dio dio, {String baseUrl}) =
  _UserListApiService;

  @GET('/user/list/all')
  Future<HttpResponse<dynamic>> getUserList();

  @GET('/user/search/list')
  Future<HttpResponse<dynamic>> searchUserFiltered(String search);

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

  @POST('/user/update')
  Future<HttpResponse<dynamic>> updateUser(UserEntity userEntity);

  @GET("/user/mysubscription")
  Future<HttpResponse<dynamic>> mySubscription(String uid);
}

import 'dart:io';

import 'package:winteam/blocs/user_api_service/user_api_service.dart';
import 'package:winteam/entities/user_entity.dart';

class UserListRepository{
  final UserListApiService _userListApiService;

  UserListRepository(this._userListApiService);


  Future<List<UserEntity>> getUserList() async {
    try {
      final httpResponse =
      await _userListApiService.getUserList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data;
      }

      throw Error();

    } on Error catch (e) {
      return  List.empty();
    }
  }
}
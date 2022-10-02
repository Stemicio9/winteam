part of 'user_list_cubit.dart';





@immutable
abstract class UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserEntity> users;
  UserListLoaded(this.users);
}

class UserListEmpty extends UserListState {}

class UserListError extends UserListState {}

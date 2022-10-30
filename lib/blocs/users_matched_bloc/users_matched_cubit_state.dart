part of 'users_matched_cubit.dart';




@immutable
abstract class UsersMatchedState {}

class UsersMatchedLoading extends UsersMatchedState {}

class UsersMatchedLoaded extends UsersMatchedState {
  final UserEntity user;
  UsersMatchedLoaded(this.user);
}

class UsersMatchedEmpty extends UsersMatchedState {}

class UsersMatchedError extends UsersMatchedState {}



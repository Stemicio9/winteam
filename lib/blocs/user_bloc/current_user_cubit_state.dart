
part of 'current_user_cubit.dart';



@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserLoggedError extends UserState {}

class UserLoaded extends UserState {
  final UserEntity user;
  UserLoaded(this.user);
}

class UserEmpty extends UserState {}

class UserError extends UserState {}

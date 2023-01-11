part of 'authentication_bloc.dart';

@immutable
abstract class UserAuthenticationState {}

class NotAuthenticated extends UserAuthenticationState {}

class UserAuthenticated extends UserAuthenticationState {
  final UserEntity user;

  UserAuthenticated(this.user);
}

part of 'authentication_bloc.dart';


@immutable
abstract class UserAuthenticationState {}

class NotAuthenticated extends UserAuthenticationState {}

class UserAuthenticated extends UserAuthenticationState {
  final String token;
 // final String role;
  // final UserEntity user;

  //UserAuthenticated(this.token, this.role, this.user);
  UserAuthenticated(this.token);
}

class UserErrorAuthentication extends UserAuthenticationState {
}

class UserAuthenticationLoading extends UserAuthenticationState {}

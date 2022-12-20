

part of 'authentication_bloc.dart';


@immutable
abstract class UserAuthenticationState {}

class NotAuthenticated extends UserAuthenticationState {}

class UserAuthenticated extends UserAuthenticationState {
  final String token;

  UserAuthenticated(this.token);
}

class UserErrorAuthentication extends UserAuthenticationState {
}

class UserAuthenticationLoading extends UserAuthenticationState {}

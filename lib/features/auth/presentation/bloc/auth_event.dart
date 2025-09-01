part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {}

final class AuthSuccess extends AuthEvent {
  final User user;

  AuthSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class AuthRegister extends AuthEvent {
  final String username;
  final String email;
  final String password;

  AuthRegister({required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [username, email, password];
}

final class AuthLogin extends AuthEvent {
  final String username;
  final String email;
  final String password;

  AuthLogin({required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [username, email, password];
}

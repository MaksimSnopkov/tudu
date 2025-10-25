import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class RegisterMethod extends Equatable {
  Future<void> register();
}

abstract class LoginMethod extends Equatable {
  Future<void> login();
}

abstract class LogoutMethod extends Equatable {
  Future<void> logout();
}

class RegisterWithEmail implements RegisterMethod {
  final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
  final Talker talker = GetIt.I.get<Talker>();
  final AuthUserData userData;

  RegisterWithEmail({required this.userData});

  @override
  Future<void> register() async {
    try {
      await auth.createUserWithEmailAndPassword(email: userData.email, password: userData.password);
      talker.info('Registration successful for user: ${userData.email}');
    } on FirebaseAuthException catch (e) {
      talker.error('Registration error: ${e.message}');
    }
  }

  @override
  List<Object?> get props => [userData.email, userData.password];

  @override
  bool get stringify => true;
}

class LoginWithEmail implements LoginMethod {
  final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
  final Talker talker = GetIt.I.get<Talker>();
  final AuthUserData userData;

  LoginWithEmail({required this.userData});

  @override
  Future<void> login() async {
    try {
      await auth.signInWithEmailAndPassword(email: userData.email, password: userData.password);
      talker.info('Login successful for user: ${userData.email}');
    } on FirebaseAuthException catch (e) {
      throw Exception('Login error: ${e.message}');
    } catch (e, st) {
      talker.handle(e, st);
    }
  }

  @override
  List<Object?> get props => [userData.email, userData.password];

  @override
  bool get stringify => true;
}

class Logout implements LogoutMethod {
  final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
  final Talker talker = GetIt.I.get<Talker>();

  @override
  Future<void> logout() async {
    try {
      await auth.signOut();
      talker.info('User logged out successfully');
    } catch (e, st) {
      talker.handle(e, st);
    }
  }

  @override
  List<Object?> get props => [auth];

  @override
  bool get stringify => true;
}

class AuthUserData {
  final String username;
  final String email;
  final String password;

  AuthUserData({required this.username, required this.email, required this.password});
}

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

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
  final AuthUserData userData;

  RegisterWithEmail({required this.userData});

  @override
  Future<void> register() async {
    try {
      await auth.createUserWithEmailAndPassword(email: userData.email, password: userData.password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  List<Object?> get props => [userData.email, userData.password];

  @override
  bool get stringify => true;
}

class LoginWithEmail implements LoginMethod {
  final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();
  final AuthUserData userData;

  LoginWithEmail({required this.userData});

  @override
  Future<void> login() async {
    await auth.signInWithEmailAndPassword(email: userData.email, password: userData.password);
  }

  @override
  List<Object?> get props => [userData.email, userData.password];

  @override
  bool get stringify => true;
}

class Logout implements LogoutMethod {
  final FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();

  @override
  Future<void> logout() async {
    await auth.signOut();
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

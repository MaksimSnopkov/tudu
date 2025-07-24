import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

abstract class RegisterMethod {
  Future<void> register();
}

abstract class LoginMethod {
  Future<void> login();
}

abstract class LogoutMethod {
  Future<void> logout();
}

class AuthWithEmailAndPassword implements RegisterMethod, LoginMethod, LogoutMethod {
  FirebaseAuth auth = GetIt.I.get<FirebaseAuth>();

  @override
  Future<void> register() async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> login() async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}

class AuthUserData {
  final String email;
  final String password;

  AuthUserData({required this.email, required this.password});
}

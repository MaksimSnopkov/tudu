import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:tudu/features/auth/data/models/auth_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthRegister>(register);
    on<AuthLogin>(login);
    on<AuthSuccess>(onAuthSuccess);
  }
  Future<void> register(AuthRegister event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Call the register method with the provided email and password
      final registerMethod = RegisterWithEmail(
        userData: AuthUserData(email: event.email, password: event.password),
      );
      await registerMethod.register();
      emit(Authenticated(user: GetIt.I.get<FirebaseAuth>().currentUser!));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> login(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Call the login method with the provided email and password
      final loginMethod = LoginWithEmail(
        userData: AuthUserData(email: event.email, password: event.password),
      );
      await loginMethod.login();
      emit(Authenticated(user: GetIt.I.get<FirebaseAuth>().currentUser!));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> onAuthSuccess(AuthSuccess event, Emitter<AuthState> emit) async {
    emit(Authenticated(user: event.user));
  }
}

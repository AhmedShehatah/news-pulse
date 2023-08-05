part of 'auth_cubit.dart';

class AuthState {
  BaseState unAutharized;
  AuthState({required this.unAutharized});
  factory AuthState.initState() => AuthState(unAutharized: BaseInitState());
}

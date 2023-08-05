part of 'auth_cubit.dart';

class AuthState {
  BaseState signIn;
  AuthState({required this.signIn});
  factory AuthState.initState() => AuthState(signIn: BaseInitState());
  AuthState copyWith({
    BaseState? signIn,
  }) =>
      AuthState(
        signIn: signIn ?? this.signIn,
      );
}

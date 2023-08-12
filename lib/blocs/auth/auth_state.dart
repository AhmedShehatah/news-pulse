part of 'auth_cubit.dart';

class AuthState {
  BaseState signIn;
  BaseState signUp;
  AuthState({required this.signIn, required this.signUp});
  factory AuthState.initState() =>
      AuthState(signIn: BaseInitState(), signUp: BaseInitState());
  AuthState copyWith({
    BaseState? signIn,
    BaseState? signUp,
  }) =>
      AuthState(
        signIn: signIn ?? this.signIn,
        signUp: signUp ?? this.signUp,
      );
}

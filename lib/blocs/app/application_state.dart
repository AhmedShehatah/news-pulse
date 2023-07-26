import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_bloc.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState.initialState());

  Future<void> init() async {
    // var authCubit = DIManager.findDep<AuthCubit>();
    // authCubit.init();

    // var token = DIManager.findDep<SharedPrefs>().getToken();
    // if (token != null) {
    //   if (Jwt.isExpired(token)) {
    //     CustomSnackbar.showSnackbar('session Expired please sign in again');
    //     DIManager.findNavigator().offAll(SignInPage.routeName);
    //   } else {
    //     int userType = Jwt.parseJwt(token)['type'];

    //     switch (LoginModeEnum.values[userType - 1]) {
    //       case LoginModeEnum.none:
    //         break;
    //       case LoginModeEnum.client:
    //         DIManager.findNavigator().offAll(UserPageParent.routeName);
    //         break;
    //       case LoginModeEnum.notary:
    //         DIManager.findNavigator().offAll(NotaryPageParent.routeName);
    //         break;
    //     }
    //     emit(state.copyWith(splashState: const BaseSuccessState()));
    //   }
    // } else {
    //   DIManager.findNavigator().offAll(SignInPage.routeName);
    //   emit(state.copyWith(splashState: const BaseSuccessState()));
    // }
  }

  void onHomeDrawer(bool isOpened) {
    emit(state.copyWith(isHomeDrawerOpened: isOpened));
  }

  Future isBottomBarShowed(bool isOpened) async {
    emit(state.copyWith(isBottomBarShowed: isOpened));
    return null;
  }

  void setSideDrawer(bool isShowed) {
    emit(state.copyWith(isSideDrawerShowed: isShowed));
  }

  Future onOverallDrawerChanged(Function setHandleOfDrawer) async {
    emit(
      state.copyWith(setHandleOfDrawer: setHandleOfDrawer),
    );
    return null;
  }

  Function? getOverallDrawerHandler() {
    return state.setHandleOfDrawer;
  }

  @override
  void emit(ApplicationState state) {
    super.emit(state);
  }
}

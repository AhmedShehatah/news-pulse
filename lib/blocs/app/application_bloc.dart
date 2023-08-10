import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/shared_prefs/shared_prefs.dart';

import 'application_state.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState.initialState());

  void updateUserStatus() {
    bool isPublisher = DIManager.findDep<SharedPrefs>().getToken() != null;
    emit(state.copyWith(isPublisher: isPublisher));
  }

  void updateAppBarStatus({required bool isMainAppBar}) {
    emit(state.copyWith(isMainAppBar: isMainAppBar));
  }

  void updateSplashAppBar({required bool isSplashScreen}) {
    emit(state.copyWith(isSplashScreen: isSplashScreen));
  }
}

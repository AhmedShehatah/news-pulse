import 'package:bloc/bloc.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/navigation/app_navigator.dart';
import 'package:news_pulse/core/shared_prefs/shared_prefs.dart';
import 'package:news_pulse/core/states/base_fail_state.dart';
import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/data/models/sign_in_model.dart';
import 'package:news_pulse/repos/auth_repo.dart';
import 'package:news_pulse/ui/home/pages/home_page.dart';

import '../../core/states/base_success_state.dart';
import '../../core/utils/ui_utlis/custom_snack_bar.dart';
import '../../data/models/publisher_modell/publisher_modell.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthState.initState());
  final AuthRepo _authRepo;
  PublisherModel? publisher;
  void signIn(SignInModel model) {
    emit(state.copyWith(signIn: const BaseLoadingState()));
    _authRepo.signIn(model).then((response) {
      if (response.hasDataOnly) {
        publisher = response.data;
        DIManager.findDep<SharedPrefs>().setToken(publisher!.token!);
        DIManager.findDep<SharedPrefs>().setId(publisher!.data!.id!);
        DIManager.findDep<SharedPrefs>()
            .setUserName(publisher!.data!.userName!);
        DIManager.findDep<SharedPrefs>().setEmail(publisher!.data!.email!);
        emit(state.copyWith(signIn: const BaseSuccessState()));
        DIManager.findDep<AppNavigator>().offAll(HomePage.routeName);
      } else {
        emit(state.copyWith(signIn: BaseFailState(response.error!)));
        CustomSnackbar.showErrorSnackbar(response.error!);
      }
    });
  }
}

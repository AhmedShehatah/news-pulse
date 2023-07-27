import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/shared_prefs/shared_prefs.dart';
import 'package:news_pulse/core/states/base_fail_state.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/utils/ui_utlis/custom_snack_bar.dart';
import 'package:news_pulse/repos/news_repo.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._repo) : super(NewsState.initState());
  final NewsRepo _repo;

  void getAllNews() {
    emit(state.copyWith(getAllNewsState: const BaseLoadingState()));
    bool isPublisher = DIManager.findDep<SharedPrefs>().getToken() != null;
    _repo.getAllNews(isPublisher: isPublisher).then((response) {
      if (response.hasDataOnly) {
        emit(state.copyWith(getAllNewsState: BaseSuccessState(response.data)));
      } else {
        CustomSnackbar.showErrorSnackbar(response.error!);
        emit(state.copyWith(getAllNewsState: BaseFailState(response.error)));
      }
    });
  }
}
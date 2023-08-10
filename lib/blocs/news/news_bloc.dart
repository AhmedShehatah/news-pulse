import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/shared_prefs/shared_prefs.dart';
import 'package:news_pulse/core/states/base_fail_state.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/utils/ui_utlis/custom_snack_bar.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/repos/news_repo.dart';
import '../../ui/home/pages/home_page.dart';
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
        Logger().e(response.error!.message!);
        emit(state.copyWith(getAllNewsState: BaseFailState(response.error)));
      }
    });
  }

  void showNews(String id) {
    emit(state.copyWith(showNewsState: const BaseLoadingState()));
    _repo.showNews(id: id).then((response) {
      if (response.hasDataOnly) {
        emit(state.copyWith(
            showNewsState: BaseSuccessState<NewsModel>(response.data)));
      } else {
        CustomSnackbar.showErrorSnackbar(response.error!);
        emit(state.copyWith(showNewsState: BaseFailState(response.error)));
      }
    });
  }

  void uploadImage(File image) {
    emit(state.copyWith(uploadImage: const BaseLoadingState()));
    _repo.uploadImage(image).then((response) {
      if (response.hasDataOnly) {
        _url = response.data;
        emit(state.copyWith(uploadImage: const BaseSuccessState()));
      } else {
        CustomSnackbar.showErrorSnackbar(response.error!);
        emit(state.copyWith(uploadImage: BaseFailState(response.error!)));
      }
    });
  }

  String? _url;
  void createNews(NewsModel model) {
    model.imageUrl = _url;
    emit(state.copyWith(createNewsState: const BaseLoadingState()));
    _repo.addNews(model).then((response) {
      if (response.hasDataOnly) {
        emit(state.copyWith(createNewsState: const BaseSuccessState()));
        DIManager.findNavigator().offAll(HomePage.routeName);
      } else {
        emit(state.copyWith(createNewsState: BaseFailState(response.error)));
        CustomSnackbar.showErrorSnackbar(response.error!);
      }
    });
  }
}

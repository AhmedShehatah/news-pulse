import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/states/base_fail_state.dart';
import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/data/models/add_news_model.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/repos/add_news_repo.dart';
import 'package:news_pulse/ui/home/pages/home_page.dart';

import '../../core/utils/ui_utlis/custom_snack_bar.dart';

part 'add_news_state.dart';

class AddNewsCubit extends Cubit<AddNewsState> {
  AddNewsCubit(this._repo) : super(AddNewsState.initState());
  final AddNewsRepo _repo;
  NewsModel? newsModel;

  String? uploadImage(File image) {
    String? url;
    _repo.uploadImage(image).then((value) {
      return url = value.data;
    });
    return url;
  }

  void createNews(AddNewsModel model) {
    emit(state.copyWith(addNews: const BaseLoadingState()));
    _repo.addNews(model).then((response) {
      if (response.hasDataOnly) {
        emit(state.copyWith(addNews: const BaseSuccessState()));
        DIManager.findNavigator().pushNamed(HomePage.routeName);
      } else {
        emit(state.copyWith(addNews: BaseFailState(response.error)));
        CustomSnackbar.showErrorSnackbar(response.error!);
      }
    });
  }
}

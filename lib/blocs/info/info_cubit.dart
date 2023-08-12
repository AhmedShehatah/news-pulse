import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/data/models//about_us_model.dart';
import 'package:news_pulse/data/models/contact_us_model.dart';
import '../../core/states/base_fail_state.dart';
import '../../core/states/base_success_state.dart';
import '../../core/utils/ui_utlis/custom_snack_bar.dart';
import '../../repos/info_repo.dart';
import 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit(this._repo) : super(InfoState.initState());
  final InfoRepo _repo;

  void contactUs(ContactUsModel model) {
    emit(state.copyWith(getContactUs: const BaseLoadingState()));

    _repo.contactUs(model).then((response) {
      if (response.hasDataOnly) {
        CustomSnackbar.showSnackbar('Sent Seccussfully');
        emit(state.copyWith(getContactUs: BaseSuccessState(response.data)));
      } else {
        CustomSnackbar.showErrorSnackbar(response.error!);
        Logger().e(response.error!.message!);
        emit(state.copyWith(getContactUs: BaseFailState(response.error)));
      }
    });
  }

  void aboutUs() {
    emit(state.copyWith(getAboutUs: const BaseLoadingState()));

    _repo.aboutUs().then((response) {
      if (response.hasDataOnly) {
        emit(state.copyWith(getAboutUs: BaseSuccessState(response.data)));
      } else {
        CustomSnackbar.showErrorSnackbar(response.error!);
        emit(state.copyWith(getAboutUs: BaseFailState(response.error)));
      }
    });
  }
}

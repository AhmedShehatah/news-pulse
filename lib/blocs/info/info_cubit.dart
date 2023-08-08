import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/data/models/contact_us_model.dart';
import '../../core/states/base_fail_state.dart';
import '../../core/states/base_success_state.dart';
import '../../core/utils/ui_utlis/custom_snack_bar.dart';
import '../../repos/info_repo.dart';
import 'info_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit(this._repo) : super(ContactUsState.initState());
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
}

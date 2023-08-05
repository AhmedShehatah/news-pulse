import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class ContactUsState {
  BaseState getContactUs;

  ContactUsState({
    required this.getContactUs,
  });

  factory ContactUsState.initState() => ContactUsState(
        getContactUs: BaseInitState(),
      );

  ContactUsState copyWith({
    BaseState? getContactUs,
  }) =>
      ContactUsState(
        getContactUs: getContactUs ?? this.getContactUs,
      );
}

import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class InfoState {
  BaseState getContactUs;
  BaseState getAboutUs;

  InfoState({
    required this.getContactUs,
    required this.getAboutUs,
  });

  factory InfoState.initState() => InfoState(
        getContactUs: BaseInitState(),
        getAboutUs: BaseInitState(),
      );

  InfoState copyWith({
    BaseState? getContactUs,
    BaseState? getAboutUs,
  }) =>
      InfoState(
        getContactUs: getContactUs ?? this.getContactUs,
        getAboutUs: getAboutUs ?? this.getAboutUs,
      );
}

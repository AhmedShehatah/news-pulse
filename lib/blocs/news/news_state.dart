import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class NewsState {
  BaseState getAllNewsState;
  BaseState showNewsState;
  NewsState({
    required this.getAllNewsState,
    required this.showNewsState,
  });

  factory NewsState.initState() => NewsState(
        getAllNewsState: BaseInitState(),
        showNewsState: BaseInitState(),
      );

  NewsState copyWith({
    BaseState? getAllNewsState,
    BaseState? showNewsState,
  }) =>
      NewsState(
        getAllNewsState: getAllNewsState ?? this.getAllNewsState,
        showNewsState: showNewsState ?? this.showNewsState,
      );
}

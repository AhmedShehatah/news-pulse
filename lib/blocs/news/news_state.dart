import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class NewsState {
  BaseState getAllNewsState;

  NewsState({
    required this.getAllNewsState,
  });

  factory NewsState.initState() => NewsState(
        getAllNewsState: BaseInitState(),
      );

  NewsState copyWith({
    BaseState? getAllNewsState,
  }) =>
      NewsState(
        getAllNewsState: getAllNewsState ?? this.getAllNewsState,
      );
}

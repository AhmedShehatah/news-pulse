import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class NewsState {
  BaseState getAllNewsState;
  BaseState showNewsState;
  BaseState createNewsState;
  BaseState uploadImage;

  NewsState({
    required this.uploadImage,
    required this.getAllNewsState,
    required this.createNewsState,
    required this.showNewsState,
  });

  factory NewsState.initState() => NewsState(
        uploadImage: BaseInitState(),
        getAllNewsState: BaseInitState(),
        createNewsState: BaseInitState(),
        showNewsState: BaseInitState(),
      );

  NewsState copyWith({
    BaseState? getAllNewsState,
    BaseState? createNewsState,
    BaseState? uploadImage,
    BaseState? showNewsState,
  }) =>
      NewsState(
        uploadImage: uploadImage ?? this.uploadImage,
        getAllNewsState: getAllNewsState ?? this.getAllNewsState,
        showNewsState: showNewsState ?? this.showNewsState,
        createNewsState: createNewsState ?? this.createNewsState,
      );
}

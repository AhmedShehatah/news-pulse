import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class NewsState {
  BaseState getAllNewsState;
  BaseState createNewsState;
  BaseState uploadImage;

  NewsState({
    required this.uploadImage,
    required this.getAllNewsState,
    required this.createNewsState,
  });

  factory NewsState.initState() => NewsState(
      uploadImage: BaseInitState(),
      getAllNewsState: BaseInitState(),
      createNewsState: BaseInitState());

  NewsState copyWith({
    BaseState? getAllNewsState,
    BaseState? createNewsState,
    BaseState? uploadImage,
  }) =>
      NewsState(
        uploadImage: uploadImage ?? this.uploadImage,
        getAllNewsState: getAllNewsState ?? this.getAllNewsState,
        createNewsState: createNewsState ?? this.createNewsState,
      );
}

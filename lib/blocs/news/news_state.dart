import 'package:news_pulse/core/states/base_init_state.dart';
import 'package:news_pulse/core/states/base_states.dart';

class NewsState {
  BaseState getAllNewsState;
  BaseState showNewsState;
  BaseState createNewsState;
  BaseState uploadImage;
  BaseState deleteNews;
  BaseState updateNews;

  NewsState({
    required this.updateNews,
    required this.deleteNews,
    required this.uploadImage,
    required this.getAllNewsState,
    required this.createNewsState,
    required this.showNewsState,
  });

  factory NewsState.initState() => NewsState(
        updateNews: BaseInitState(),
        deleteNews: BaseInitState(),
        uploadImage: BaseInitState(),
        getAllNewsState: BaseInitState(),
        createNewsState: BaseInitState(),
        showNewsState: BaseInitState(),
      );

  NewsState copyWith({
    BaseState? deleteNews,
    BaseState? updateNews,
    BaseState? getAllNewsState,
    BaseState? createNewsState,
    BaseState? uploadImage,
    BaseState? showNewsState,
  }) =>
      NewsState(
        updateNews: updateNews ?? this.updateNews,
        deleteNews: deleteNews ?? this.deleteNews,
        uploadImage: uploadImage ?? this.uploadImage,
        getAllNewsState: getAllNewsState ?? this.getAllNewsState,
        showNewsState: showNewsState ?? this.showNewsState,
        createNewsState: createNewsState ?? this.createNewsState,
      );
}

part of 'add_news_cubit.dart';

class AddNewsState {
  AddNewsState({required this.addNews});

  BaseState addNews;
  factory AddNewsState.initState() => AddNewsState(addNews: BaseInitState());
  AddNewsState copyWith({BaseState? addNews}) => AddNewsState(
        addNews: addNews ?? this.addNews,
      );
}

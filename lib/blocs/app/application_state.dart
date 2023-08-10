import '../../core/states/base_states.dart';

class ApplicationState {
  bool isPublisher;
  bool isMainAppBar;
  bool isSplashScreen;

  ApplicationState({
    required this.isMainAppBar,
    required this.isPublisher,
    required this.isSplashScreen,
  });

  factory ApplicationState.initialState() => ApplicationState(
        isMainAppBar: true,
        isPublisher: false,
        isSplashScreen: true,
      );

  ApplicationState copyWith({
    BaseState? publisherState,
    BaseState? mainAppBarState,
    bool? isPublisher,
    bool? isMainAppBar,
    bool? isSplashScreen,
  }) {
    return ApplicationState(
      isMainAppBar: isMainAppBar ?? this.isMainAppBar,
      isPublisher: isPublisher ?? this.isPublisher,
      isSplashScreen: isSplashScreen ?? this.isSplashScreen,
    );
  }
}

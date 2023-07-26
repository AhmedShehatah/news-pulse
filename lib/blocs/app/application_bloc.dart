import '../../core/states/base_init_state.dart';
import '../../core/states/base_states.dart';

class ApplicationState {
  BaseState splashState;

  bool isHomeDrawerOpened;
  bool isSideDrawerShowed;
  Function? setHandleOfDrawer;
  bool isBottomBarShowed;

  ApplicationState({
    required this.splashState,
    this.setHandleOfDrawer,
    required this.isSideDrawerShowed,
    required this.isHomeDrawerOpened,
    required this.isBottomBarShowed,
    // required this.userProfile,
  });

  factory ApplicationState.initialState() => ApplicationState(
        splashState: BaseInitState(),
        isHomeDrawerOpened: false,
        isBottomBarShowed: true,
        isSideDrawerShowed: false,
      );

  ApplicationState copyWith(
      {BaseState? splashState,
      Function? setHandleOfDrawer,
      bool? isHomeDrawerOpened,
      bool? isSideDrawerShowed,
      bool? isBottomBarShowed}) {
    return ApplicationState(
      splashState: splashState ?? this.splashState,
      setHandleOfDrawer: setHandleOfDrawer ?? this.setHandleOfDrawer,
      isSideDrawerShowed: isSideDrawerShowed ?? this.isSideDrawerShowed,
      isHomeDrawerOpened: isHomeDrawerOpened ?? this.isHomeDrawerOpened,
      isBottomBarShowed: isBottomBarShowed ?? this.isBottomBarShowed,
    );
  }
}

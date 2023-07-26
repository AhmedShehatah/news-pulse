import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_pulse/core/di/modules/netwrok_module.dart';

import '../constants/app_colors.dart';

final getIt = GetIt.instance;

class DIManager {
  DIManager._();

  /// this function is responsable for
  /// Init all dependencies as soon as
  /// the app starts
  static Future<void> initDI() async {
    // inject app nav here

    // inject app colors here
    _injectDep(const AppColorsController());

    // inject network module here
    _injectDep(NetowrkModule.provideDio());

    // inject app cubit here

    ////  ----------------------  Inject Remote data sources here ------------------------
    /// EX
    ///  _injectDep<GeneralRemoteDataSource>(const GeneralRemoteDataSourceImpl());

    /// -------------------------- Inject Repos Here  -------------------------
    /// EX
    ///  _injectDep<RepoInterface>(RepoImpl(findDep()));

    /// --------------------------- Inject Cubit Here -----------------------------------
    /// EX
    /// _injectDep(GeneralCubit(findDep<GeneralRepoFacade>()));
  }

  /// this function is responsable for
  /// injecting dependecies
  static T _injectDep<T extends Object>(T dependency) {
    getIt.registerSingleton<T>(dependency);
    return getIt<T>();
  }

  /// this function is responsable for
  /// finding injected deps
  static T findDep<T extends Object>() {
    return getIt<T>();
  }

  /// this function is helpers to find navgiator
// static AppNavigator findNavigator() {
//     return findDep<AppNavigator>();
//   }

  /// It's helper method to retrieve the [AppColorsController] Class
  /// And  {*findCC} equals to FindColorsController
  static AppColorsController findCC() {
    return findDep<AppColorsController>();
  }

  /// It's helper method to retrieve the [ApplicationCubit] Class
  /// And  {*findAC} equals to FindApplicationCubit
  // static ApplicationCubit findAC() {
  //   return findDep<ApplicationCubit>();
  // }

  static _setupSharedPreference() async {
    await GetStorage.init();
    // _injectDep(SharedPrefs());
  }
}

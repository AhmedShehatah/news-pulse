import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_pulse/blocs/news/news_bloc.dart';
import 'package:news_pulse/core/di/modules/netwrok_module.dart';
import 'package:news_pulse/core/navigation/app_navigator.dart';
import 'package:news_pulse/data/sources/auth_remote_data_source.dart';
import 'package:news_pulse/data/sources/news_remote_data_source.dart';
import 'package:news_pulse/repos/news_repo.dart';

import '../../blocs/app/application_state.dart';
import '../../blocs/auth/auth_cubit.dart';
import '../../repos/auth_repo.dart';
import '../constants/app_colors.dart';
import '../shared_prefs/shared_prefs.dart';

final getIt = GetIt.instance;

class DIManager {
  DIManager._();

  /// this function is responsable for
  /// Init all dependencies as soon as
  /// the app starts
  static Future<void> initDI() async {
    // inject app nav here
    _injectDep(AppNavigator());

    // inject app colors here
    _injectDep(AppColorsController());

    // inject network module here
    _injectDep(NetowrkModule.provideDio());

    // inject app cubit here
    _injectDep(ApplicationCubit());

    // inject sharedPrefs here
    await _setupSharedPreference();

    ////  ----------------------  Inject Remote data sources here ------------------------
    /// EX
    ///  _injectDep<GeneralRemoteDataSource>(const GeneralRemoteDataSourceImpl());
    _injectDep<NewsRemoteDataSource>(NewsRemoteDataSourceImpl());
    _injectDep<AuthRemoteDataSource>(AuthRemoteDataSourceImp());

    /// -------------------------- Inject Repos Here  -------------------------
    /// EX
    ///  _injectDep<RepoInterface>(RepoImpl(findDep()));
    _injectDep<NewsRepo>(NewsRepoImpl(findDep<NewsRemoteDataSource>()));
    _injectDep<AuthRepo>(AuthRepoImp(findDep<AuthRemoteDataSource>()));

    /// --------------------------- Inject Cubit Here -----------------------------------
    /// EX
    /// _injectDep(GeneralCubit(findDep<GeneralRepoFacade>()));
    _injectDep(NewsCubit(findDep<NewsRepo>()));
    _injectDep(AuthCubit(findDep<AuthRepo>()));
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
  static AppNavigator findNavigator() {
    return findDep<AppNavigator>();
  }

  /// It's helper method to retrieve the [AppColorsController] Class
  /// And  {*findCC} equals to FindColorsController
  static AppColorsController findCC() {
    return findDep<AppColorsController>();
  }

  // / It's helper method to retrieve the [ApplicationCubit] Class
  // / And  {*findAC} equals to FindApplicationCubit
  static ApplicationCubit findAC() {
    return findDep<ApplicationCubit>();
  }

  static _setupSharedPreference() async {
    await GetStorage.init();
    _injectDep(SharedPrefs());
  }

  static dispose() {
    findDep<ApplicationCubit>().close();
  }
}

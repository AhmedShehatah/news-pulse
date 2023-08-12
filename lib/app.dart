import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:news_pulse/core/navigation/navigation_observer.dart';
import 'package:news_pulse/ui/about_us/pages/about_us_page.dart';
import 'package:news_pulse/ui/root/pages/root_page.dart';

//import 'package:news_pulse/ui/splash_screen/pages/splash_screen.dart';

import 'blocs/app/application_bloc.dart';
import 'blocs/app/application_state.dart';
import 'core/constants/app_consts.dart';
import 'core/di/di_manager.dart';
import 'core/navigation/route_generator.dart';
import 'core/utils/screen_utlis/device_utils.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: BlocProvider<ApplicationCubit>(
        create: (context) => ApplicationCubit(),
        child: ScreenUtilInit(
          designSize: const Size(376, 812),
          builder: (context, _) {
            return BlocConsumer<ApplicationCubit, ApplicationState>(
              listener: (_, __) {},
              buildWhen: (s0, s1) {
                return false;
              },
              listenWhen: (s0, s1) {
                return false;
              },
              builder: (context, state) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  enableLog: false,
                  onGenerateRoute: RouteGenerator.generateRoutes,
                  navigatorObservers: [AppNavigationObserver()],
                  builder: ((context, widget) {
                    ScreenHelper(context);
                    return RootPage(shownWidgetOnScreen: widget);
                  }),
                  theme: ThemeData(
                    fontFamily: 'Cairo',
                    primaryColor: DIManager.findCC().primaryColor,
                    // accentColor:
                    //     DIManager.findDep<AppColorsController>().primaryColor,
                    colorScheme: ColorScheme.fromSwatch()
                        .copyWith(secondary: DIManager.findCC().primaryColor),
                  ),
                  title: AppConsts.appName,
                  initialRoute: AboutUsPage.routeName,
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    DIManager.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:news_pulse/ui/home/pages/home_parent_page.dart';

//import 'package:news_pulse/ui/contact_us/pages/contact_us.dart';

//import 'package:news_pulse/ui/home/pages/home_page.dart';
//import 'package:news_pulse/ui/sigin/pages/signin_page.dart';

import 'blocs/app/application_bloc.dart';
import 'blocs/app/application_state.dart';
import 'core/constants/app_colors.dart';
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
                  builder: ((context, widget) {
                    ScreenHelper(context);
                    // TODO return main widget
                    return Container(
                      child: widget,
                    );
                    // return DrawerOverAllWidget(child: widget);
                  }),
                  theme: ThemeData(
                      // Making Roboto Regular the default font for Project
                      fontFamily: 'Cairo',
                      primaryColor:
                          DIManager.findDep<AppColorsController>().primaryColor,
                      // accentColor:
                      //     DIManager.findDep<AppColorsController>().primaryColor,
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                          secondary: DIManager.findDep<AppColorsController>()
                              .primaryColor)),
                  title: AppConsts.appName,
                  initialRoute: HomeParentPage.routeName,
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
    DIManager.findAC().init();
  }

  @override
  void dispose() {
    DIManager.dispose();
    super.dispose();
  }
}

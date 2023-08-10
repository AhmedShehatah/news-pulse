import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/ui/contact_us/pages/contact_us.dart';
import 'package:news_pulse/ui/sigin/pages/signin_page.dart';
import 'package:news_pulse/ui/sigin/pages/signup_page.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    Logger().d('pushed new route ${route.settings.name}');
    if (route.settings.name == SignInPage.routName ||
            route.settings.name == SignUpPage.routName ||
            ContactUs.routeName == route.settings.name
        // ShowNewsPage.routeName == route.settings.name

        ) {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: false);
    } else {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: true);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    Logger().d('popped new route ${route.settings.name}');
    if (route.settings.name == SignInPage.routName ||
            route.settings.name == SignUpPage.routName ||
            ContactUs.routeName == route.settings.name
        // ShowNewsPage.routeName == route.settings.name

        ) {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: true);
    } else {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: false);
    }
  }
}

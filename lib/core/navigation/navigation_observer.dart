import 'package:flutter/material.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/ui/about_us/pages/about_us_page.dart';
import 'package:news_pulse/ui/contact_us/pages/contact_us.dart';
import 'package:news_pulse/ui/publisher_news/publisher_show_news.dart';

import '../../ui/show_news/pages/show_news_page.dart';
import '../../ui/sigin_signup/pages/signin_page.dart';
import '../../ui/sigin_signup/pages/signup_page.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == SignInPage.routName ||
        route.settings.name == SignUpPage.routName ||
        route.settings.name == ContactUs.routeName ||
        route.settings.name == ShowNewsPage.routeName ||
        route.settings.name == PublisherShowNewsPage.routeName ||
        route.settings.name == AboutUsPage.routeName) {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: false);
    } else {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: true);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.settings.name == SignInPage.routName ||
        route.settings.name == SignUpPage.routName ||
        route.settings.name == ContactUs.routeName ||
        route.settings.name == ShowNewsPage.routeName ||
        route.settings.name == PublisherShowNewsPage.routeName ||
        route.settings.name == AboutUsPage.routeName) {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: true);
    } else {
      DIManager.findAC().updateAppBarStatus(isMainAppBar: false);
    }
  }
}

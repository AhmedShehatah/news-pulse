import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:news_pulse/ui/contact_us/pages/contact_us.dart';
import 'package:news_pulse/ui/home/pages/home_page.dart';
import 'package:news_pulse/ui/show_news/pages/show_news_page.dart';
import 'package:news_pulse/ui/sigin_signup/pages/signin_page.dart';
import 'package:news_pulse/ui/splash_screen/pages/splash_screen.dart';

import '../../ui/home/pages/home_parent_page.dart';
import '../../ui/sigin_signup/pages/signup_page.dart';

class RouteGenerator {
  static Route? generateRoutes(RouteSettings settings) {
    final args = settings.arguments;
    return PageRouteBuilder(
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return SharedAxisTransition(
          animation: animation,
          fillColor: Colors.white,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
      reverseTransitionDuration: const Duration(milliseconds: 125),
      transitionDuration: const Duration(milliseconds: 225),
      pageBuilder: (c, a1, a2) {
        return getPage(settings, args);
      },
      settings: settings,
    );
  }

  static Widget getPage(RouteSettings settings, args) {
    switch (settings.name) {
      /// EX
      // case SplashScreen.routeName:
      // return const SplashScreen();
      case HomePage.routeName:
        return const HomePage();
      case ContactUs.routeName:
        return const ContactUs();
      case SignInPage.routName:
        return const SignInPage();
      case SignUpPage.routName:
        return const SignUpPage();
      case HomeParentPage.routeName:
        return const HomeParentPage();
      case SplashScreen.routeName:
        return const SplashScreen();
      case ShowNewsPage.routeName:
        return ShowNewsPage();
      default:
        settings = RouteSettings(
            arguments: settings.arguments, name: DefaultRoute.routeName);
        return const DefaultRoute();
    }
  }
}

class DefaultRoute extends StatelessWidget {
  static const routeName = '/DefaultRoute';

  const DefaultRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_pulse/ui/home/pages/home_parent_page.dart';

import '../../../core/constants/dimens.dart';
import '../../../core/di/di_manager.dart';
import '../../../core/utils/ui_utlis/vertical_padding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeParentPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DIManager.findCC().primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerticalPadding(5),
          Padding(
            padding: Dimens.horizontalPadding1,
            child: Image.asset(
              "assets/images/logo_transparent.png",
              fit: BoxFit.contain,
            ),
          ),
          const VerticalPadding(7),
          Padding(
              padding: Dimens.horizontalPadding2,
              child: Text(
                "Your comprehensive guide to the latest local and international news",
                style: TextStyle(
                  fontSize: 20,
                  color: DIManager.findCC().white,
                ),
              ))
        ],
      ),
    );
  }
}

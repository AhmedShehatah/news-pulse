import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_pulse/core/enums/drawer_icon_file_icons.dart';

import '../di/di_manager.dart';

enum DrawerIcons { contactUs, signIn, signUp, logOut, aboutUs }

final drawerIconsList = {
  DrawerIcons.signIn: Icon(
    DrawerIconFile.signin,
    color: DIManager.findCC().primaryColor,
  ),
  DrawerIcons.signUp: Icon(
    DrawerIconFile.signup,
    color: DIManager.findCC().primaryColor,
  ),
  DrawerIcons.logOut: Icon(
    DrawerIconFile.logout,
    color: DIManager.findCC().primaryColor,
  ),
  DrawerIcons.aboutUs: Icon(
    DrawerIconFile.aboutus,
    color: DIManager.findCC().primaryColor,
  ),
  DrawerIcons.contactUs: Icon(
    DrawerIconFile.contactUs,
    color: DIManager.findCC().primaryColor,
    size: 30,
  )
};

import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_fonts.dart';
import 'package:news_pulse/core/constants/app_style.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/enums/drawer_icons.dart';
import 'package:news_pulse/core/shared_prefs/shared_prefs.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/ui/contact_us/pages/contact_us.dart';
import 'package:news_pulse/ui/home/pages/home_parent_page.dart';
import 'package:news_pulse/ui/sigin_signup/pages/signup_page.dart';

import '../../sigin_signup/pages/signin_page.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    required this.isPublisher,
    this.onCloseDrawer,
  });
  final bool isPublisher;
  final String? publisherName =
      DIManager.findDep<SharedPrefs>().getUserName() ?? "";
  final String? publisherEmail =
      DIManager.findDep<SharedPrefs>().getEmail() ?? "";
  final Null Function()? onCloseDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: DIManager.findCC().fieldsFillColor,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
              // padding: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                color: DIManager.findCC().primaryColor,
                /* image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/logo_transparent.png",
                  ),
                  fit: BoxFit.contain,
                ),*/
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/images/logo_transparent.png"),
                  const VerticalPadding(2),
                  Text(
                    publisherName!.toUpperCase(),
                    style: TextStyle(
                        fontSize: AppFontSize.fontSize_16,
                        color: DIManager.findCC().greyLightTextColor),
                  ),
                  Text(
                    publisherEmail!,
                    style: TextStyle(
                      color: DIManager.findCC().greyLightTextColor,
                      fontSize: AppFontSize.fontSize_12,
                    ),
                  ),
                ],
              )

              /* ,
          */
              ),
          ListTile(
            onTap: () {
              DIManager.findNavigator().pushNamed(ContactUs.routeName);
              onCloseDrawer!();
            },
            style: ListTileStyle.drawer,
            leading: drawerIconsList[DrawerIcons.contactUs],
            title: Text("Contact Us", style: AppStyle.bigTitleStyle),
          ),
          ListTile(
            onTap: () {
              onCloseDrawer!();
              DIManager.findNavigator().pushNamed(ContactUs.routeName);
            },
            style: ListTileStyle.drawer,
            leading: drawerIconsList[DrawerIcons.aboutUs],
            title: Text("About Us", style: AppStyle.bigTitleStyle),
          ),
          if (!isPublisher)
            ListTile(
              onTap: () {
                DIManager.findNavigator().pushNamed(SignUpPage.routName);
                onCloseDrawer!();
              },
              style: ListTileStyle.drawer,
              leading: drawerIconsList[DrawerIcons.signUp],
              title: Text("Join As Publisher", style: AppStyle.bigTitleStyle),
            ),
          if (!isPublisher)
            ListTile(
              onTap: () {
                DIManager.findNavigator().pushNamed(SignInPage.routName);
                onCloseDrawer!();
              },
              style: ListTileStyle.drawer,
              leading: drawerIconsList[DrawerIcons.signIn],
              title: Text("Log in", style: AppStyle.bigTitleStyle),
            ),
          if (isPublisher)
            ListTile(
              onTap: () {
                onCloseDrawer!();
                DIManager.findDep<SharedPrefs>().logout();
                DIManager.findAC().updateUserStatus();
                DIManager.findNavigator().offAll(HomeParentPage.routeName);
              },
              style: ListTileStyle.drawer,
              leading: drawerIconsList[DrawerIcons.logOut],
              title: Text("Log Out", style: AppStyle.bigTitleStyle),
            ),
        ]),
      ),
    );
  }
}

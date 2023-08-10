import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_style.dart';
import 'package:news_pulse/core/shared_prefs/shared_prefs.dart';
import 'package:news_pulse/core/utils/string_utils/string_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/horizontal_padding.dart';
import '../../../core/constants/dimens.dart';
import '../../../core/di/di_manager.dart';
import '../../../core/utils/screen_utlis/device_utils.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({
    super.key,
    required this.isMainBar,
    required this.isPublisher,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;
  final bool isMainBar;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final bool isPublisher;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          isMainBar ? Icons.menu : Icons.arrow_back,
          color: DIManager.findCC().scaffoldBGColor,
          size: ScreenHelper.fromWidth(7),
        ),
        onPressed: isMainBar
            ? () => _scaffoldKey.currentState?.openDrawer()
            : () => DIManager.findNavigator().pop(),
      ),
      toolbarHeight: ScreenHelper.fromWidth(18),
      elevation: 0,
      backgroundColor: DIManager.findCC().primaryColor,
      actions: [
        Padding(
          padding: Dimens.defaultPageHorizontalPadding,
          child: isPublisher
              ? _buildPublisherName()
              : Image.asset('assets/images/logo_transparent.png',
                  width: ScreenHelper.fromWidth(30),
                  height: ScreenHelper.fromWidth(15)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
  Widget _buildPublisherName() {
    var name = DIManager.findDep<SharedPrefs>().getUserName() ?? 'noname';
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: DIManager.findCC().publisherAvatarColor,
          child: Text(
            name![0].toUpperCase(),
            style: AppStyle.bigTitleStyle,
          ),
        ),
        const HorizontalPadding(2),
        Text(name),
      ],
    );
  }
}

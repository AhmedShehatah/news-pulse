import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColorsController {
  AppColorsController();

  final Rx<Color?> _primaryColor = const Color(0xDDD42B1E).obs;
  final String _primaryColorStr = "#EE3E43";

  Color get primaryColor => _primaryColor.value ?? defaultPrimaryColor;

  String get primaryColorStr => _primaryColorStr;

  Color black = Colors.black;
  Color bottomSheetShadow = const Color(0xFF000019);
  Color greyTextColor = const Color(0xFF505050);

  Color hintTextColor = const Color(0x6666668D);
  Color greyLightTextColor = const Color(0xFFA6A6A6);
  Color navyBlue = const Color(0xAA033B44);
  Color scaffoldBGColor = Colors.white;

  Color linkBlue = const Color(0xff2072FF);

  Color borderTextFieldColor = Colors.grey.withOpacity(0.3);
  Color borderButtonColor = Colors.grey.withOpacity(0.5);

  Color yellow = const Color(0xFFEEBF3F);
  Color grey = const Color(0xFFF3F3F3);

  Color textButtonBackground = const Color(0x00000000);
  Color defaultPrimaryColor = const Color(0xFF8DCA26);

  Color greenProgressColor = const Color(0xff3ec478);

  Color darkGreyTextColor = const Color(0xff1f2630);
  Color blueLightGreyColor = const Color(0xFFf5f7ff);

  Color notSelectedGrey = const Color(0xFF7A8FA6);
  Color white = Colors.white;
  Color notaryWhite = const Color(0xFFfbfcff);
  Color darkGreyBorderColor = const Color(0xff4f617d);
  Color jeansBlueColor = const Color(0xffecf1f9);
  Color invalidGreyColor = const Color(0xfff2f4f9);
}

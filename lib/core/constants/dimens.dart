import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/screen_utlis/device_utils.dart';

class Dimens {
  Dimens._();
  static EdgeInsets textFormFieldPadding =
      EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 30.h);
  static EdgeInsets cardInternalPadding =
      EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w);
  static EdgeInsets cardSmallInternalPadding =
      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w);
  static EdgeInsets textPadding =
      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w);
  static EdgeInsets smallVerticalPadding = EdgeInsets.symmetric(vertical: 7.w);

  static double defaultBorderWidth = ScreenHelper.fromWidth55(0.35);

  static double cardBorderRadius = 10.w;
  static double bottomSheetBorderRadius = 15.w;
  static double strokeThikness = 3.w;
  static double textFormBorder = 10.w;
  static double defaultBorderRadius = 10.w;
  static double dialogBorderRadius = 15.w;

  static double bigBorderRadius = 25.w;
  static double iconSize = 24.w;
  static double bigIconSize = 40.w;
  static final EdgeInsets itemHorizontalPadding_4 =
      EdgeInsets.symmetric(horizontal: 4.w);
  static final EdgeInsets itemHorizontalPadding_6 =
      EdgeInsets.symmetric(horizontal: 6.w);
  static final EdgeInsets itemVerticalPadding_4 =
      EdgeInsets.symmetric(vertical: 4.h);
  static final sheetHeaderPadding =
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h);
  static final EdgeInsets horizontalPadding1 =
      EdgeInsets.symmetric(horizontal: 20.w);
  static final EdgeInsets horizontalPadding2 =
      EdgeInsets.symmetric(horizontal: ScreenHelper.fromWidth55(10.0));
  static final EdgeInsets defaultPageHorizontalPadding =
      EdgeInsets.symmetric(horizontal: ScreenHelper.fromWidth55(6.0));
  static final EdgeInsets defaultPageHorizontalPaddingSmall =
      EdgeInsets.symmetric(horizontal: ScreenHelper.fromWidth55(4.0));

  static double get appbarBorderRadius => 0.0;
}

import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_fonts.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';

import 'loading_widgets.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {this.margin,
      required this.buttonText,
      required this.onPressed,
      required this.isLoading,
      super.key});
  final String buttonText;
  final Function() onPressed;
  final bool isLoading;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.fromHeight(6),
      width: ScreenHelper.width,
      margin: margin ?? Dimens.cardInternalPadding,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
          ),
          textStyle: TextStyle(
            fontSize: AppFontSize.fontSize_18,
          ),
          backgroundColor: DIManager.findCC().primaryColor,
          foregroundColor: DIManager.findCC().lightgrey,
          side: BorderSide(
            color: DIManager.findCC().lightgrey,
          ),
        ),
        onPressed: () {
          if (isLoading) return;
          onPressed();
        },
        child: isLoading
            ? WidgetDotFade(color: DIManager.findCC().white, size: 20.0)
            : Text(buttonText),
      ),
    );
  }
}

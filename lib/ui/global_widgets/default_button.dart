import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_fonts.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {required this.buttonText, required this.onPressed, super.key});
  final Widget buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.fromHeight(6),
      width: ScreenHelper.width,
      margin: Dimens.cardInternalPadding,
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
        onPressed: onPressed,
        child: buttonText,
      ),
    );
  }
}

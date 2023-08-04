import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_fonts.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {required this.buttonText, required this.onPressed, super.key});
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: DIManager.findCC().white,
      width: ScreenHelper.width,
      margin: Dimens.defaultPageHorizontalPaddingSmall,
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
        child: Text(buttonText),
      ),
    );
  }
}
/*ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(DIManager.findCC().lightgrey),
            side: MaterialStateProperty.all(
                BorderSide(color: DIManager.findCC().lightgrey)),
            backgroundColor:
                MaterialStateProperty.all(DIManager.findCC().primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),*/
            /*OutlinedButton.styleFrom(
          textStyle: TextStyle(
            fontSize: AppFontSize.fontSize_18,
          ),
          backgroundColor: DIManager.findCC().primaryColor,
          foregroundColor: DIManager.findCC().lightgrey,
          side: BorderSide(
            color: DIManager.findCC().lightgrey,
          ),
        ), */

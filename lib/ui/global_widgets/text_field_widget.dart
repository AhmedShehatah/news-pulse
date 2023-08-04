import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_fonts.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    this.isPassword = false,
    required this.fieldIcon,
    required this.textController,
    required this.label,
    required this.hint,
    this.heigh = 6,
    super.key,
  });
  final bool isPassword;
  final Icon fieldIcon;
  final String label;
  final String hint;
  final double heigh;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.cardInternalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: AppFontSize.fontSize_16,
                color: DIManager.findCC().lightgrey),
          ),
          SizedBox(height: ScreenHelper.fromHeight(1.5)),
          TextField(
            style: TextStyle(
                letterSpacing: 2,
                color: DIManager.findCC().black,
                fontSize: AppFontSize.fontSize_14),
            obscureText: isPassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: fieldIcon,
              filled: true,
              constraints:
                  BoxConstraints(maxHeight: ScreenHelper.fromHeight(heigh)),
              hintText: hint,
              labelText: label,
              fillColor: DIManager.findCC().white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.bigBorderRadius),
              ),
            ),
          )
        ],
      ),
    );
  }
}

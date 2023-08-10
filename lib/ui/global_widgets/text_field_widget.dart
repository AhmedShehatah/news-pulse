import 'package:flutter/material.dart';
import 'package:news_pulse/core/constants/app_fonts.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
//import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/core/validators/base_validator.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    this.warningColor,
    this.margin,
    this.fillColor,
    this.isLabeled = true,
    this.isPassword = false,
    this.fieldIcon,
    required this.textController,
    required this.label,
    required this.hint,
    required this.validators,
    this.maxLine = 1,
    this.minLine = 1,
    super.key,
  });
  final Color? warningColor;
  final Color? fillColor;
  final bool isPassword;
  final bool isLabeled;
  final Icon? fieldIcon;
  final String label;
  final String hint;
  final TextEditingController textController;
  final List<BaseValidator?> validators;
  final int maxLine;
  final int minLine;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Dimens.cardInternalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLabeled)
            Text(
              label,
              style: TextStyle(
                  fontSize: AppFontSize.fontSize_16,
                  color: DIManager.findCC().lightgrey),
            ),
          if (isLabeled) const VerticalPadding(2.5),
          TextFormField(
            minLines: minLine,
            maxLines: maxLine,
            textInputAction: TextInputAction.next,
            controller: textController,
            validator: (value) {
              return BaseValidator.validateValue(
                  context, value, validators, true);
            },
            style: TextStyle(
                letterSpacing: 2,
                color: DIManager.findCC().black,
                fontSize: AppFontSize.fontSize_14),
            obscureText: isPassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              errorStyle: TextStyle(
                fontSize: AppFontSize.fontSize_12,
                color: warningColor ?? DIManager.findCC().white,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: fieldIcon,
              filled: true,
              hintText: hint,
              labelText: label,
              contentPadding: Dimens.textFormFieldPadding,
              fillColor: fillColor ?? DIManager.findCC().white,
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

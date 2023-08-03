import 'package:flutter/material.dart';
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
    this.heigh = 50,
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
      // padding: const EdgeInsets.all(5),
      child: TextField(
        obscureText: isPassword,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: fieldIcon,
          filled: true,

          floatingLabelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),

          // icon: Icon(Icons.abc),
          labelStyle: TextStyle(color: DIManager.findCC().black),
          labelText: label,
          constraints: BoxConstraints(maxHeight: ScreenHelper.fromHeight(6)),
          hintText: hint,
          fillColor: DIManager.findCC().white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.bigBorderRadius),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/enums/text_field_icons.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/ui/global_widgets/text_field_widget.dart';

import '../../../core/constants/dimens.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  static const String routName = "/sign-in-page";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: DIManager.findCC().primaryColor,
      body: Container(
        padding: Dimens.cardInternalPadding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenHelper.fromHeight(8)),
              Image.asset(
                "assets/images/logo_transparent.png",
                fit: BoxFit.contain,
              ),
              SizedBox(height: ScreenHelper.fromHeight(15)),
              TextFieldWidget(
                  fieldIcon: iconsList[TextFieldIcon.email]!,
                  textController: emailController,
                  label: "Email",
                  hint: "Enter Email"),
              TextFieldWidget(
                fieldIcon: iconsList[TextFieldIcon.password]!,
                textController: passwordController,
                label: "Password",
                hint: "Enter Password",
                isPassword: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

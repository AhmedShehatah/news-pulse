import 'package:flutter/material.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/enums/text_field_icons.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/ui/global_widgets/default_button.dart';
import 'package:news_pulse/ui/global_widgets/text_field_widget.dart';

import '../../../core/constants/dimens.dart';
import '../../../core/utils/ui_utlis/vertical_padding.dart';

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenHelper.fromHeight(8)),
            Padding(
              padding: Dimens.horizontalPadding1,
              child: Image.asset(
                "assets/images/logo_transparent.png",
                fit: BoxFit.contain,
              ),
            ),
            VerticalPadding(ScreenHelper.fromHeight(1.25)),
            TextFieldWidget(
                fieldIcon: iconsList[TextFieldIcon.email]!,
                textController: emailController,
                label: "Email",
                hint: "example@test.com"),
            TextFieldWidget(
              fieldIcon: iconsList[TextFieldIcon.password]!,
              textController: passwordController,
              label: "Password",
              hint: "Enter Password",
              isPassword: true,
            ),
            SizedBox(height: ScreenHelper.fromHeight(5)),
            DefaultButton(buttonText: "Submit", onPressed: () {}),
            SizedBox(height: ScreenHelper.fromHeight(5)),
          ],
        ),
      ),
    );
  }
}

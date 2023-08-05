import 'package:flutter/material.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/enums/text_field_icons.dart';
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
            const VerticalPadding(7),
            Padding(
              padding: Dimens.horizontalPadding1,
              child: Image.asset(
                "assets/images/logo_transparent.png",
                fit: BoxFit.contain,
              ),
            ),
            const VerticalPadding(11),
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
            const VerticalPadding(5),
            DefaultButton(buttonText: "Submit", onPressed: () {}),
            const VerticalPadding(11),
          ],
        ),
      ),
    );
  }
}

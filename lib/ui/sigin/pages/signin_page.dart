import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/blocs/auth/auth_cubit.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/enums/text_field_icons.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/validators/email_validator.dart';
import 'package:news_pulse/core/validators/password_validator.dart';
import 'package:news_pulse/core/validators/required_validator.dart';
import 'package:news_pulse/ui/global_widgets/default_button.dart';
import 'package:news_pulse/ui/global_widgets/text_field_widget.dart';
import '../../../core/constants/dimens.dart';
import '../../../core/utils/ui_utlis/vertical_padding.dart';
import '../../../data/models/sign_in_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String routName = "/sign-in-page";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignInModel signInModel = SignInModel();

  void submit() {
    signInModel.email = emailController.text;
    signInModel.password = passwordController.text;
    if (_formKey.currentState?.validate() ?? false) {
      DIManager.findDep<AuthCubit>().signIn(signInModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: DIManager.findCC().primaryColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        bloc: DIManager.findDep<AuthCubit>(),
        builder: (context, state) {
          var authState = state.signIn;
          if (authState is BaseSuccessState) {
            return Container();
          } else {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                        validators: [
                          EmailValidator(),
                          RequiredValidator(),
                        ],
                        fieldIcon: iconsList[TextFieldIcon.email]!,
                        textController: emailController,
                        label: "Email",
                        hint: "example@test.com"),
                    TextFieldWidget(
                      validators: [
                        PasswordValidator(),
                        RequiredValidator(),
                      ],
                      fieldIcon: iconsList[TextFieldIcon.password]!,
                      textController: passwordController,
                      label: "Password",
                      hint: "Enter Password",
                      isPassword: true,
                    ),
                    const VerticalPadding(5),
                    DefaultButton(buttonText: "Submit", onPressed: submit),
                    const VerticalPadding(11),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

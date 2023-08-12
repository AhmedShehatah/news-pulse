import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/validators/username_validator.dart';

import '../../../blocs/auth/auth_cubit.dart';
import '../../../core/constants/dimens.dart';
import '../../../core/di/di_manager.dart';
import '../../../core/enums/text_field_icons.dart';
import '../../../core/states/base_success_state.dart';
import '../../../core/utils/ui_utlis/vertical_padding.dart';
import '../../../core/validators/email_validator.dart';
import '../../../core/validators/password_validator.dart';
import '../../../core/validators/required_validator.dart';
import '../../../data/models/sign_up_model.dart';
import '../../global_widgets/default_button.dart';
import '../../global_widgets/text_field_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routName = "/sign-up-page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignUpModel signUpModel = SignUpModel();

  void submit() {
    signUpModel.email = emailController.text;
    signUpModel.password = passwordController.text;
    signUpModel.userName = usernameController.text;
    if (_formKey.currentState?.validate() ?? false) {
      DIManager.findDep<AuthCubit>().signUp(signUpModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const VerticalPadding(10),
                    Padding(
                      padding: Dimens.horizontalPadding1,
                      child: Image.asset(
                        "assets/images/logo_transparent.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const VerticalPadding(6),
                    TextFieldWidget(
                      validators: [
                        EmailValidator(),
                        RequiredValidator(),
                      ],
                      fieldIcon: iconsList[TextFieldIcon.email]!,
                      textController: emailController,
                      label: "Email",
                      hint: "example@test.com",
                    ),
                    TextFieldWidget(
                        validators: [
                          UsernameValidator(),
                          RequiredValidator(),
                        ],
                        fieldIcon: iconsList[TextFieldIcon.username]!,
                        textController: usernameController,
                        label: "Username",
                        hint: "Enter Username"),
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
                    const VerticalPadding(3),
                    BlocBuilder<AuthCubit, AuthState>(
                      bloc: DIManager.findDep<AuthCubit>(),
                      builder: (context, state) {
                        bool isLoading = state.signUp is BaseLoadingState;
                        return DefaultButton(
                            isLoading: isLoading,
                            buttonText: "Submit",
                            onPressed: submit);
                      },
                    ),
                    const VerticalPadding(5),
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
    usernameController.dispose();
    passwordController.dispose();
  }
}

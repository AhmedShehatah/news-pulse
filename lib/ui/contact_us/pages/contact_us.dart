import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/blocs/info/info_cubit.dart';
import 'package:news_pulse/blocs/info/info_state.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/validators/email_validator.dart';
import 'package:news_pulse/core/validators/required_validator.dart';
import 'package:news_pulse/data/models/contact_us_model.dart';

import '../../../core/constants/dimens.dart';
import '../../../core/di/di_manager.dart';
import '../../../core/enums/text_field_icons.dart';
import '../../../core/utils/ui_utlis/vertical_padding.dart';
import '../../global_widgets/default_button.dart';
import '../../global_widgets/text_field_widget.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  static const String routeName = "/contact-us-page";

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController reportController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  ContactUsModel contactUsModel = ContactUsModel();

  void submit() {
    contactUsModel.email = emailController.text;
    contactUsModel.report = reportController.text;
    if (_formKey.currentState?.validate() ?? false) {
      DIManager.findDep<ContactUsCubit>().contactUs(contactUsModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: DIManager.findCC().primaryColor,
      body: BlocBuilder<ContactUsCubit, ContactUsState>(
        bloc: DIManager.findDep<ContactUsCubit>(),
        builder: (context, state) {
          var contactUsState = state.getContactUs;
          if (contactUsState is BaseSuccessState) {
            return Container();
          } else {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VerticalPadding(5),
                    Padding(
                      padding: Dimens.horizontalPadding1,
                      child: Image.asset(
                        "assets/images/logo_transparent.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const VerticalPadding(7),
                    TextFieldWidget(
                      fieldIcon: iconsList[TextFieldIcon.email]!,
                      textController: emailController,
                      label: "Email",
                      hint: "example@test.com",
                      validators: [
                        EmailValidator(),
                      ],
                    ),
                    TextFieldWidget(
                      textController: reportController,
                      label: "Message",
                      hint: "Enter Message",
                      validators: [
                        RequiredValidator(),
                      ],
                      minLine: 6,
                      maxLine: 6,
                    ),
                    const VerticalPadding(4),
                    BlocBuilder<ContactUsCubit, ContactUsState>(
                      bloc: DIManager.findDep<ContactUsCubit>(),
                      builder: (context, state) {
                        bool isLoading =
                            (state.getContactUs is BaseLoadingState);
                        return DefaultButton(
                          isLoading: isLoading,
                          buttonText: "Submit",
                          onPressed: submit,
                        );
                      },
                    ),
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
    reportController.dispose();
  }
}

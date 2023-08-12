import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/data/models//about_us_model.dart';

import '../../../blocs/info/info_cubit.dart';
import '../../../blocs/info/info_state.dart';
import '../../../core/constants/app_style.dart';
import '../../../core/constants/dimens.dart';
import '../../../core/di/di_manager.dart';
import '../../../core/states/base_fail_state.dart';
import '../../../core/states/base_success_state.dart';
import '../../../core/states/base_wait_state.dart';
import '../../../core/utils/ui_utlis/vertical_padding.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});
  static const String routeName = "/about-us-page";
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DIManager.findCC().lightgreyBackground,
      body: BlocBuilder<InfoCubit, InfoState>(
        bloc: DIManager.findDep<InfoCubit>(),
        builder: (context, state) {
          var aboutState = state.getAboutUs;
          if (aboutState is BaseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (aboutState is BaseFailState) {
            return const Center(
              child: Text("Error! please Try again later",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 183, 15, 3))),
            );
          } else if (aboutState is BaseSuccessState) {
            var us = aboutState.data as AboutUsModel;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: us.imageUrl!,
                      width: ScreenHelper.width,
                      fit: BoxFit.fill,
                      height: ScreenHelper.height * 0.4,
                    ),
                  ),
                  const VerticalPadding(2),
                  Padding(
                    padding: Dimens.cardInternalPadding,
                    child: Text(us.content!, style: AppStyle.text14Style),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    DIManager.findDep<InfoCubit>().aboutUs();
  }
}

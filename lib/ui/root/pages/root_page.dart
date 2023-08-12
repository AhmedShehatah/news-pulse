import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/blocs/app/application_bloc.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/ui/contact_us/pages/contact_us.dart';
import 'package:news_pulse/ui/root/widgets/user_appbar.dart';

import '../../../blocs/app/application_state.dart';
import '../widgets/drawer.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key, required this.shownWidgetOnScreen});
  static const String routeName = "/root-page";
  final Widget? shownWidgetOnScreen;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationCubit, ApplicationState>(
      bloc: DIManager.findAC(),
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(
            isPublisher: state.isPublisher,
            onCloseDrawer: () {
              _scaffoldKey.currentState!.closeDrawer();
            },
          ),
          appBar: state.isSplashScreen
              ? null
              : UserAppBar(
                  isPublisher: state.isPublisher,
                  isMainBar: state.isMainAppBar,
                  scaffoldKey: _scaffoldKey,
                ),
          body: widget.shownWidgetOnScreen,
        );
      },
    );
  }
}

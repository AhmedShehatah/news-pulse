import 'package:flutter/material.dart';

import '../screen_utlis/device_utils.dart';

class HorizontalPadding extends StatelessWidget {
  final double percentage;

  const HorizontalPadding(this.percentage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: ScreenHelper.fromWidth(percentage));
  }
}

import 'package:flutter/material.dart';
import '../screen_utlis/device_utils.dart';

class VerticalPadding extends StatelessWidget {
  final double percentage;

  const VerticalPadding(this.percentage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ScreenHelper.fromHeight(percentage));
  }
}

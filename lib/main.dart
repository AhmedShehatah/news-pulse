import 'package:flutter/material.dart';
import 'package:news_pulse/core/di/di_manager.dart';

import 'app.dart';

void main() async {
  /// Init DIManger
  await DIManager.initDI();

  runApp(const App());
}

import 'dart:ui';

import '../../../core/errors/base_error.dart';
import 'base_states.dart';

class BaseFailState extends BaseState {
  final BaseError? error;
  final VoidCallback? callback;

  const BaseFailState(this.error, {this.callback});
}

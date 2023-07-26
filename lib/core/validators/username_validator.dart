import 'package:string_validator/string_validator.dart';

import 'base_validator.dart';

class UsernameValidator extends BaseValidator {
  @override
  String getMessage() {
    return 'username must contain only letters and numbers';
  }

  @override
  bool validate(String? value) {
    return value != null && isAlphanumeric(value);
  }
}

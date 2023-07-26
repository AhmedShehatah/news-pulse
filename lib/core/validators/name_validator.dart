import 'package:string_validator/string_validator.dart';

import 'base_validator.dart';

class NameValidator extends BaseValidator {
  @override
  String getMessage() {
    return 'name consists only of letters';
  }

  @override
  bool validate(String? value) {
    return value != null && isAlpha(value);
  }
}

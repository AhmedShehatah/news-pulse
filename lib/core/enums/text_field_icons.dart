import 'package:flutter/material.dart';

enum TextFieldIcon {
  email,
  password,
  message,
  username,
}

final iconsList = {
  TextFieldIcon.email: const Icon(Icons.email_outlined),
  TextFieldIcon.password: const Icon(Icons.lock_outline),
  TextFieldIcon.message: const Icon(Icons.message_outlined),
  TextFieldIcon.username: const Icon(Icons.person),
};

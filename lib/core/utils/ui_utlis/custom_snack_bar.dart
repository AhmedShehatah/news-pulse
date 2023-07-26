import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../di/di_manager.dart';
import '../../errors/base_error.dart';
import '../screen_utlis/device_utils.dart';

class CustomSnackbar {
  static const String routeName = 'CustomSnackbar/showSnackbar';

  static showSnackbar(String message) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.horizontal,
      margin: EdgeInsets.all(ScreenHelper.fromHeight(1)),
      duration: const Duration(seconds: 4),
      borderRadius: ScreenHelper.fromWidth55(0.5),
      animationDuration: const Duration(seconds: 1),
      backgroundColor: DIManager.findDep<AppColorsController>()
          .primaryColor
          .withOpacity(0.9),
      isDismissible: true,
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static showErrorSnackbar(BaseError error) {
    Get.snackbar(
      'error',
      'message',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
      isDismissible: true,
      titleText: Text(
        'error',
        style:
            TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.bold),
      ),
      messageText: Row(
        children: [
          Expanded(
            child: Text(
              error.message ?? '',
              maxLines: 2,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

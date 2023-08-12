import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();
}

class AppFontSize {
  AppFontSize._();

  static double get _scaleFactor => 1.15;

  /// Font sizes
  static double get fontSize_8 => 8 * _scaleFactor;

  static double get fontSize_10 => 10 * _scaleFactor;

  static double get fontSize_11 => 11 * _scaleFactor;

  static double get fontSize_12 => 12 * _scaleFactor;

  static double get fontSize_13 => 13 * _scaleFactor;

  static double get fontSize_14 => 14 * _scaleFactor;

  static double get fontSize_16 => 16 * _scaleFactor;

  static double get fontSize_18 => 18 * _scaleFactor;

  static double get fontSize_20 => 20 * _scaleFactor;

  static double get fontSize_25 => 25 * _scaleFactor;

  static double get fontSize_30 => 30 * _scaleFactor;

  static double get fontSize_40 => 40 * _scaleFactor;
}

class AppFontWeight {
  AppFontWeight._();

  static FontWeight light = FontWeight.w300;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight regular = FontWeight.normal;
  static FontWeight bold = FontWeight.bold;
}

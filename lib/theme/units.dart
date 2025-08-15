import 'package:flutter/widgets.dart';

abstract class AppUnits {
  static double iconSize = 24.0;

  // Spaces (vertical)
  static SizedBox y4 = const SizedBox(height: 4);
  static SizedBox y8 = const SizedBox(height: 8);
  static SizedBox y12 = const SizedBox(height: 12);
  static SizedBox y16 = const SizedBox(height: 16);
  static SizedBox y20 = const SizedBox(height: 20);
  static SizedBox y24 = const SizedBox(height: 24);
  static SizedBox y32 = const SizedBox(height: 32);
  static SizedBox y40 = const SizedBox(height: 40);
  static SizedBox y48 = const SizedBox(height: 48);
  static SizedBox y64 = const SizedBox(height: 64);
  static SizedBox y80 = const SizedBox(
    height: 80,
  ); // Large top gap (like login screen)

  // Spaces (horizontal)
  static SizedBox x4 = const SizedBox(width: 4);
  static SizedBox x8 = const SizedBox(width: 8);
  static SizedBox x12 = const SizedBox(width: 12);
  static SizedBox x16 = const SizedBox(width: 16);
  static SizedBox x20 = const SizedBox(width: 20);
  static SizedBox x24 = const SizedBox(width: 24);
  static SizedBox x32 = const SizedBox(width: 32);
  static SizedBox x40 = const SizedBox(width: 40);

  // Paddings (all sides)
  static EdgeInsets a4 = const EdgeInsets.all(4);
  static EdgeInsets a8 = const EdgeInsets.all(8);
  static EdgeInsets a12 = const EdgeInsets.all(12);
  static EdgeInsets a16 = const EdgeInsets.all(16);
  static EdgeInsets a20 = const EdgeInsets.all(20);
  static EdgeInsets a24 = const EdgeInsets.all(
    24,
  ); // Default horizontal padding
  static EdgeInsets a32 = const EdgeInsets.all(32);
  static EdgeInsets a40 = const EdgeInsets.all(40);

  // Paddings (only horizontal or vertical)
  static EdgeInsets px24 = const EdgeInsets.symmetric(
    horizontal: 24,
  ); // Common for screens
  static EdgeInsets px16 = const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets py16 = const EdgeInsets.symmetric(vertical: 16);
  static EdgeInsets py20 = const EdgeInsets.symmetric(vertical: 20);

  // Special large paddings for top-heavy layouts
  static EdgeInsets pt80px24 = const EdgeInsets.only(
    top: 80,
    left: 24,
    right: 24,
  );
}

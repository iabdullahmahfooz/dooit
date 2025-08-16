import 'package:flutter/widgets.dart';
import 'colors.dart';

abstract class AppText {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  // Body
  static const TextStyle b1 = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );

  static const TextStyle b2 = TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
  );

  static const TextStyle b3 = TextStyle(
    fontSize: 12,
    color: AppColors.textColor,
  );

  // Labels
  static const TextStyle l1 = TextStyle(
    fontSize: 10,
    color: AppColors.greyColor,
  );

  static const TextStyle l2 = TextStyle(
    fontSize: 8,
    color: AppColors.greyColor,
  );
}

import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DooitApp());
}

class DooitApp extends StatelessWidget {
  const DooitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
      ),
      initialRoute: AppRoutes.getStarted,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

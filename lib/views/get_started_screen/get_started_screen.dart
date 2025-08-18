import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart'; 
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackNavigationWrapper(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Padding(
          padding: AppUnits.a24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppUnits.a40.top),

              Text(
                'Get Started',
                style: AppText.h1.copyWith(color: AppColors.textColor),
              ),

              SizedBox(height: AppUnits.a8.top),

              Text(
                'create task · set reminder · track progress',
                style: AppText.b1.copyWith(color: AppColors.greyColor),
              ),

              SizedBox(height: AppUnits.a20.top),

              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/illustrations/get_started.jpg',
                    height: 350,
                  ),
                ),
              ),

              Column(
                children: [
                  CustomButton(
                    label: 'Login',
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    ),
                  ),
                  SizedBox(height: AppUnits.a16.top),

                  CustomButton(
                    label: 'Signup',
                    onTap: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.signup,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppUnits.a32.top),
            ],
          ),
        ),
      ),
    );
  }
}

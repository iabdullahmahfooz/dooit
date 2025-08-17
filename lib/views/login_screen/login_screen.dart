import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/utils/static_assets.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/password_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppUnits.px24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppUnits.y40,

                Text('Login to your account', style: AppText.h1),
                AppUnits.y40,

                const EmailInputField(),
                AppUnits.y20,

                Text('Password', style: AppText.b2),
                AppUnits.y8,
                const PasswordInputField(),
                AppUnits.y12,

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      AppRoutes.forgetPasswordScreen,
                    ),
                    child: Text(
                      'Forgot password?',
                      style: AppText.b2.copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ),

                AppUnits.y20,

                CustomButton(
                  label: 'Login',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.homeScreen),
                ),
                AppUnits.y48,

                Center(
                  child: Text(
                    'OR LOGIN WITH:',
                    style: AppText.b2.copyWith(color: Colors.grey[600]),
                  ),
                ),
                AppUnits.y24,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(StaticAssets.fbIcon, height: 42),
                    AppUnits.x32,
                    Image.asset(StaticAssets.appleIcon, height: 42),
                    AppUnits.x32,
                    Image.asset(StaticAssets.googleIcon, height: 42),
                  ],
                ),
                AppUnits.y40,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: AppText.b2),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, AppRoutes.signupScreen),
                      child: Text(
                        'Sign up',
                        style: AppText.b2.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                AppUnits.y20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

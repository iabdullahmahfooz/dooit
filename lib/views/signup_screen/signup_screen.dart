import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/password_input_field.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackNavigationWrapper(
      child: GestureDetector(
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

                  Text('Create your account', style: AppText.h1),
                  AppUnits.y32,

                  Text('Full Name', style: AppText.b2),
                  AppUnits.y8,
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'eg Abdullah Jatt',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: AppUnits.a12,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                    ],
                    keyboardType: TextInputType.name,
                  ),
                  AppUnits.y20,

                  const EmailInputField(),
                  AppUnits.y20,

                  Text(
                    'Password',
                    style: AppText.b2.copyWith(color: AppColors.textColor),
                  ),
                  AppUnits.y8,
                  const PasswordInputField(),
                  AppUnits.y32,

                  CustomButton(
                    label: 'Sign Up',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                  ),
                  AppUnits.y48,

                  Center(
                    child: Text(
                      'OR SIGN UP WITH:',
                      style: AppText.b2.copyWith(color: Colors.grey[600]),
                    ),
                  ),
                  AppUnits.y20,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/facebook.png', height: 42),
                      AppUnits.x32,
                      Image.asset('assets/icons/apple.png', height: 42),
                      AppUnits.x32,
                      Image.asset('assets/icons/google.png', height: 42),
                    ],
                  ),
                  AppUnits.y40,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: AppText.b2),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, AppRoutes.login);
                        },
                        child: Text(
                          'Login',
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/utils/static_assets.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/password_input_field.dart';
import '../../utils/snackbar_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime? _lastBackPressTime;

  Future<bool> _onWillPop() {
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;

      showSmallSnackBar(
        context,
        "Exit App",
        "Press back again to exit",
        contentType: ContentType.warning,
      );

      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BackNavigationWrapper(
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
                          AppRoutes.forgetPassword,
                        ),
                        child: Text(
                          'Forgot password?',
                          style: AppText.b2.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),

                    AppUnits.y20,

                    CustomButton(
                      label: 'Login',
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      ),
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
                          onPressed: () => Navigator.popAndPushNamed(
                            context,
                            AppRoutes.signup,
                          ),
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
        ),
      ),
    );
  }
}

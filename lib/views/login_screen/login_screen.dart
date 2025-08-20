import 'package:flutter/material.dart';
import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/utils/static_assets.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dooit/widgets/custom_button.dart';
import 'package:dooit/widgets/email_input_field.dart';
import 'package:dooit/widgets/password_input_field.dart';
import 'package:dooit/utils/snackbar_helper.dart';
import 'package:dooit/utils/validators_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  DateTime? _lastBackPressTime;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onPopInvokedWithResult(bool didPop, Object? result) {
    if (didPop) return;

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
    } else {
      Navigator.of(context).pop(true);
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } else {
      showSmallSnackBar(
        context,
        "Invalid Input",
        "Please fill in all fields correctly",
        contentType: ContentType.failure,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvokedWithResult,
      child: BackNavigationWrapper(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: AppUnits.hx24,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppUnits.y40,
                      Text('Login to your account', style: AppText.h1),
                      AppUnits.y40,

                      EmailInputField(
                        controller: _emailController,
                        validator: ValidatorsHelper.validateEmail,
                      ),
                      AppUnits.y20,

                      Text('Password', style: AppText.b2),
                      AppUnits.y8,

                      PasswordInputField(
                        controller: _passwordController,
                        validator: ValidatorsHelper.validatePassword,
                      ),
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

                      CustomButton(label: 'Login', onTap: _login),
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
                                Navigator.pushNamed(context, AppRoutes.signup),
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
      ),
    );
  }
}

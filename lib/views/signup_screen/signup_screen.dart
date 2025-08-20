import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dooit/widgets/custom_button.dart';
import 'package:dooit/widgets/email_input_field.dart';
import 'package:dooit/widgets/password_input_field.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart';
import 'package:dooit/utils/validators_helper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackNavigationWrapper(
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

                    Text('Create your account', style: AppText.h1),
                    AppUnits.y32,

                    Text('Full Name', style: AppText.b2),
                    AppUnits.y8,
                    TextFormField(
                      controller: _fullNameController,
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
                      validator: ValidatorsHelper.validateName,
                    ),
                    AppUnits.y20,

                    EmailInputField(
                      controller: _emailController,
                      validator: ValidatorsHelper.validateEmail,
                    ),
                    AppUnits.y20,

                    Text(
                      'Password',
                      style: AppText.b2.copyWith(color: AppColors.textColor),
                    ),
                    AppUnits.y8,
                    PasswordInputField(
                      controller: _passwordController,
                      validator: ValidatorsHelper.validatePassword,
                    ),
                    AppUnits.y32,

                    CustomButton(
                      label: 'Sign Up',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.home,
                            (route) => false,
                          );
                        }
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
      ),
    );
  }
}

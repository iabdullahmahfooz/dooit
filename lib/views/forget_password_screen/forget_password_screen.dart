import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // ✅ Dismiss keyboard
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppUnits.a20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Back Arrow
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    color: AppColors.textColor,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                AppUnits.y12,

                // Title
                const Text(
                  'Reset your password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                AppUnits.y12,

                // Subtitle
                const Text(
                  'Enter your email address to receive password reset instructions.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.left,
                ),
                AppUnits.y40,

                // Email field
                const EmailInputField(),
                AppUnits.y40,
              ],
            ),
          ),
        ),

        // ✅ Button fixed at bottom
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                20, // stays above keyboard
          ),
          child: CustomButton(
            label: 'Next',
            onTap: () => Navigator.pushNamed(context, '/new_password_screen'),
          ),
        ),
      ),
    );
  }
}

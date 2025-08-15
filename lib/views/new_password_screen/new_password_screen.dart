import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/password_input_field.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          FocusScope.of(context).unfocus(), // ✅ Hide keyboard on tap outside
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
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    color: AppColors.textColor,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                AppUnits.y12,

                // Title
                const Text(
                  'Create New Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.left,
                ),
                AppUnits.y12,

                // Subtitle
                const Text(
                  'Your new password must be different from previously used passwords.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.left,
                ),
                AppUnits.y40,

                // New Password
                const Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                AppUnits.y8,
                const PasswordInputField(),
                AppUnits.y40,

                // Confirm Password
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                AppUnits.y8,
                const PasswordInputField(),
                AppUnits.y20,
              ],
            ),
          ),
        ),

        // ✅ Button fixed at bottom
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: CustomButton(
            label: 'Save Password',
            onTap: () {
              Navigator.pushNamed(context, '/login_screen');
            },
          ),
        ),
      ),
    );
  }
}

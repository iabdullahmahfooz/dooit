import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/routes/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/password_input_field.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _onSavePassword() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in both fields")),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    AppRoutes.pushReplacement(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppUnits.px24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    color: AppColors.textColor,
                    icon: const Icon(Icons.arrow_back),

                    onPressed: () => AppRoutes.pushReplacement(
                      context,
                      AppRoutes.forgetPassword,
                    ),
                  ),
                ),
                AppUnits.y20,

                Text(
                  'Create New Password',
                  style: AppText.h1,
                  textAlign: TextAlign.left,
                ),
                AppUnits.y12,

                Text(
                  'Your new password must be different from previously used passwords.',
                  style: AppText.b2.copyWith(color: Colors.black54),
                  textAlign: TextAlign.left,
                ),
                AppUnits.y40,

                Text(
                  'New Password',
                  style: AppText.b2.copyWith(fontWeight: FontWeight.w500),
                ),
                AppUnits.y8,
                PasswordInputField(controller: _newPasswordController),
                AppUnits.y40,

                Text(
                  'Confirm Password',
                  style: AppText.b2.copyWith(fontWeight: FontWeight.w500),
                ),
                AppUnits.y8,
                PasswordInputField(controller: _confirmPasswordController),
                AppUnits.y20,
              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: CustomButton(label: 'Save Password', onTap: _onSavePassword),
        ),
      ),
    );
  }
}

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/routes/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/password_input_field.dart';
import '../../utils/validators_helper.dart';
import '../../utils/snackbar_helper.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onSavePassword() {
    if (_formKey.currentState!.validate()) {
      showSmallSnackBar(
        context,
        "Success",
        "Password updated successfully",
        contentType: ContentType.success,
      );
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      String errorMessage = "Please fix the errors in the form";
      final newPasswordError = ValidatorsHelper.validatePassword(
        _newPasswordController.text,
      );
      final confirmPasswordError = ValidatorsHelper.confirmPasswordValidator(
        _newPasswordController,
      )(_confirmPasswordController.text);

      if (newPasswordError != null) {
        errorMessage = newPasswordError;
      } else if (confirmPasswordError != null) {
        errorMessage = confirmPasswordError;
      }

      showSmallSnackBar(
        context,
        "Error",
        errorMessage,
        contentType: ContentType.failure,
      );
    }
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
            padding: AppUnits.hx24,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: AppColors.textColor,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.forgetPassword,
                      ),
                    ),
                  ),
                  AppUnits.y20,
                  Text('Create New Password', style: AppText.h1),
                  AppUnits.y12,
                  Text(
                    'Your new password must be different from previously used passwords.',
                    style: AppText.b2.copyWith(color: Colors.black54),
                  ),
                  AppUnits.y40,
                  Text(
                    'New Password',
                    style: AppText.b2.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppUnits.y8,
                  PasswordInputField(
                    controller: _newPasswordController,
                    validator: ValidatorsHelper.validatePassword,
                  ),
                  AppUnits.y40,
                  Text(
                    'Confirm Password',
                    style: AppText.b2.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppUnits.y8,
                  PasswordInputField(
                    controller: _confirmPasswordController,
                    validator: ValidatorsHelper.confirmPasswordValidator(
                      _newPasswordController,
                    ),
                  ),
                  AppUnits.y20,
                ],
              ),
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

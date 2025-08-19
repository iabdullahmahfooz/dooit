import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/routes/routes.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/custom_button.dart';
import '../../utils/validators_helper.dart';
import '../../utils/snackbar_helper.dart'; // Assuming this is where showSmallSnackBar is located

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _onNextPressed() {
    if (_formKey.currentState!.validate()) {
      showSmallSnackBar(
        context,
        "Success",
        "Password reset instructions sent to your email",
        contentType: ContentType.success,
      );
      Navigator.popAndPushNamed(context, AppRoutes.newPassword);
    } else {
      String errorMessage =
          ValidatorsHelper.validateEmail(_emailController.text) ??
          "Please enter a valid email";
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
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      color: AppColors.textColor,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  AppUnits.y20,
                  Text(
                    'Reset your password',
                    style: AppText.h1,
                    textAlign: TextAlign.left,
                  ),
                  AppUnits.y12,
                  Text(
                    'Enter your email address to receive password reset instructions.',
                    style: AppText.b2.copyWith(color: Colors.black54),
                    textAlign: TextAlign.left,
                  ),
                  AppUnits.y40,
                  EmailInputField(
                    controller: _emailController,
                    validator: ValidatorsHelper.validateEmail,
                  ),
                  AppUnits.y40,
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
          child: CustomButton(label: 'Next', onTap: _onNextPressed),
        ),
      ),
    );
  }
}

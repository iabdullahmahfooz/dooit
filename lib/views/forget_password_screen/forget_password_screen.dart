import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/routes/routes.dart';
import '../../widgets/email_input_field.dart';
import '../../widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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

                const EmailInputField(),
                AppUnits.y40,
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
          child: CustomButton(
            label: 'Next',
            onTap: () {
              Navigator.popAndPushNamed(context, AppRoutes.newPassword);
            },
          ),
        ),
      ),
    );
  }
}

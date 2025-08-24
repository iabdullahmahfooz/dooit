import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:dooit/utils/back_navigation_wrapper.dart';
import 'package:dooit/widgets/custom_button.dart';
import 'package:dooit/utils/snackbar_helper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dooit/routes/routes.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _handleBackNavigation() {
    Navigator.pushReplacementNamed(context, AppRoutes.forgetPassword);
  }

  void _verifyCode() {
    final code = _otpControllers.map((c) => c.text).join();

    if (code.length == 6) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.newPassword,
        (route) => false,
      );
    } else {
      showSmallSnackBar(
        context,
        "Invalid Code",
        "Please enter the 6-digit code",
        contentType: ContentType.failure,
      );
    }
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: _otpControllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: AppColors.fields,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 30;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _resendCode() {
    showSmallSnackBar(
      context,
      "Code Sent",
      "A new verification code has been sent to your email",
      contentType: ContentType.success,
    );

    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _handleBackNavigation();
        }
      },
      child: BackNavigationWrapper(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Padding(
                padding: AppUnits.hx24,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: _handleBackNavigation,
                        ),
                      ),

                      AppUnits.y24,
                      Text("Verify your email", style: AppText.h1),
                      AppUnits.y8,
                      Text(
                        "Enter the 6-digit code sent to your email.",
                        style: AppText.b2.copyWith(color: AppColors.greyColor),
                      ),
                      AppUnits.y40,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                          (index) => _buildOtpField(index),
                        ),
                      ),

                      AppUnits.y20,

                      Center(
                        child: _secondsRemaining > 0
                            ? Text(
                                "Resend code in $_secondsRemaining s",
                                style: AppText.b2.copyWith(color: AppColors.greyColor),
                              )
                            : TextButton(
                                onPressed: _resendCode,
                                child: Text(
                                  "Resend Code",
                                  style: AppText.b2.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),

                      const Spacer(),

                      CustomButton(label: "Verify", onTap: _verifyCode),

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

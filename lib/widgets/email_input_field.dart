import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';

class EmailInputField extends StatefulWidget {
  final TextEditingController? controller;

  const EmailInputField({super.key, this.controller});

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  String? _errorText;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email", style: AppText.b2.copyWith(color: AppColors.textColor)),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'eg abdullah@gmail.com',
            hintStyle: AppText.b1.copyWith(color: Colors.black45),
            errorText: _errorText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.textColor,
            ),
          ),
          onChanged: (value) {
            setState(() {
              if (value.isEmpty || _isValidEmail(value)) {
                _errorText = null;
              } else {
                _errorText = 'Please enter a valid email';
              }
            });
          },
        ),
      ],
    );
  }
}

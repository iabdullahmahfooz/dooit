import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/utils/validators_helper.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const EmailInputField({
    super.key,
    this.controller,
    this.label = "Email",
    this.hint,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.b2.copyWith(color: AppColors.textColor)),
        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          validator: validator ?? ValidatorsHelper.validateEmail,
          decoration: InputDecoration(
            hintText: hint ?? 'eg: abdullah@gmail.com',
            hintStyle: AppText.b1.copyWith(color: Colors.black45),
            filled: true,
            fillColor: AppColors.fields,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.scaffoldBackgroundColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.scaffoldBackgroundColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.textColor,
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

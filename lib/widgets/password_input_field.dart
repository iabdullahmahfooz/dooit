import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/utils/validators_helper.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool obscureText;

  const PasswordInputField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.onChanged,
    this.obscureText = true,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppText.b2.copyWith(color: AppColors.textColor),
          ),
          const SizedBox(height: 8),
        ],

        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator ?? ValidatorsHelper.validatePassword,
          decoration: InputDecoration(
            hintText: widget.hint ?? 'Enter your password',
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
              Icons.lock_outline,
              color: AppColors.textColor,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textColor,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

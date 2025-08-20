import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';
import 'package:flutter/services.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.inputFormatters,
    this.keyboardType,
  });

  InputDecoration _filledFieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppText.b2.copyWith(color: AppColors.greyColor),
      filled: true,
      fillColor: Colors.white,
      contentPadding: AppUnits.a16,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.b2),
        AppUnits.y8,
        TextFormField(
          controller: controller,
          style: AppText.b1,
          maxLines: maxLines,
          decoration: _filledFieldDecoration(hint),
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

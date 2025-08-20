import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';

class DeadlinePickerField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const DeadlinePickerField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
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
      suffixIcon: const Icon(Icons.keyboard_arrow_down),
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
          readOnly: true,
          controller: TextEditingController(text: value),
          style: AppText.b1,
          decoration: _filledFieldDecoration("Select date and time"),
          onTap: onTap,
        ),
      ],
    );
  }
}

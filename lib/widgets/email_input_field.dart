import 'package:flutter/material.dart';

class EmailInputField extends StatefulWidget {
  const EmailInputField({super.key});

  @override
  State<EmailInputField> createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  final TextEditingController _controller = TextEditingController();
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
        const Text('Email'),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'eg abdullah@gmail.com',
            errorText: _errorText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
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

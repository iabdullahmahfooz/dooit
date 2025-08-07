import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/password_input_field.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'Create New Password',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  const Text(
                    'Your new password must be different from previously used passwords.',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 42),
                  const PasswordInputField(),
                  const Text('New Password'),
                  const SizedBox(height: 8),

                  const SizedBox(height: 20),

                  const Text('Confirm Password'),
                  const PasswordInputField(),
                  const SizedBox(height: 8),

                  const Spacer(),

                  CustomButton(
                    label: 'Save Password',
                    onTap: () {
                      // Navigate to success screen or login
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

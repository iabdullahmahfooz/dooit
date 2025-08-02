import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/app_bar.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar('Get Started'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              'Get Started',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'create task . set reminder . track progress',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Center(
                child: Image.asset(
                  'lib/assets/illustrations/get_started.jpg', // Replace with your own image path
                  height: 250,
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  label: 'Login',
                  onTap: () => Navigator.pushNamed(context, '/login'),
                ),
                SizedBox(height: 16),
                CustomButton(
                  label: 'Signup',
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

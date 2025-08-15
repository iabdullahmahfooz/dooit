import 'package:dooit/routes/routes.dart';
import 'package:dooit/theme/units.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppUnits.a24, // using app units instead of fixed 24.0
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppUnits.a40.top), // top spacing
            Text(
              'Get Started',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppUnits.a8.top), // small gap
            Text(
              'create task . set reminder . track progress',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: AppUnits.a20.top),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/illustrations/get_started.jpg',
                  height: 350,
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  label: 'Login',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.loginScreen),
                ),
                SizedBox(height: AppUnits.a16.top),
                CustomButton(
                  label: 'Signup',
                  onTap: () => Navigator.pushNamed(context, '/signup_screen'),
                ),
              ],
            ),
            SizedBox(height: AppUnits.a32.top),
          ],
        ),
      ),
    );
  }
}

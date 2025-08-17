import 'package:flutter/material.dart';
import 'package:dooit/theme/colors.dart';
import 'package:dooit/theme/typography.dart';
import 'package:dooit/theme/units.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;

  const CustomAppBar({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppUnits.a16,
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purple[100],
                child: Text(userName.substring(0, 1), style: AppText.h3),
              ),
              const Spacer(),
              const Icon(Icons.search),
              AppUnits.x16,
              const Icon(Icons.notifications_none),
            ],
          ),
        ),

        Padding(
          padding: AppUnits.a16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Hello $userName", style: AppText.h2),
                  AppUnits.x8,
                  const Text("👋", style: TextStyle(fontSize: 24)),
                ],
              ),
              AppUnits.y8,
              Text(
                "Let’s get started keeping your tasks organized",
                style: AppText.b2.copyWith(color: AppColors.greyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

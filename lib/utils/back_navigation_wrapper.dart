import 'package:flutter/material.dart';

class BackNavigationWrapper extends StatelessWidget {
  final Widget child;
  const BackNavigationWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: Navigator.canPop(context), child: child);
  }
}

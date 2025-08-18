import 'package:flutter/material.dart';

class BackNavigationWrapper extends StatelessWidget {
  final Widget child;
  const BackNavigationWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return false;
        }
        return true; 
      },
      child: child,
    );
  }
}

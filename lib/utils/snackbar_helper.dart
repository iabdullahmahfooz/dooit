import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

void showSmallSnackBar(
  BuildContext context,
  String title,
  String message, {
  ContentType contentType = ContentType.success,
}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

    content: Transform.scale(
      scale: 0.85,
      child: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    ),
    duration: const Duration(seconds: 2),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

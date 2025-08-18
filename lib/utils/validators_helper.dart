import 'package:flutter/material.dart';

class ValidatorsHelper {
  /// Validate email field
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  }

  /// Validate password field
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  /// Validate name field (for signup)
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name cannot be empty";
    }
    if (value.trim().length < 2) {
      return "Name must be at least 2 characters";
    }
    return null;
  }

  /// Confirm password validator (returns a closure)
  static FormFieldValidator<String> confirmPasswordValidator(
    TextEditingController passwordController,
  ) {
    return (value) {
      if (value == null || value.isEmpty) {
        return "Confirm password cannot be empty";
      }
      if (value != passwordController.text) {
        return "Passwords do not match";
      }
      return null;
    };
  }
}

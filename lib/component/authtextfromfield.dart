import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscuredText;
  final VoidCallback? onPressedVisibility;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  AuthTextFromField({
    required this.controller,
    required this.obscuredText,
    this.onPressedVisibility,
    required this.hintText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon, required obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuredText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            obscuredText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onPressedVisibility,
        )
            : null,
      ),
    );
  }
}
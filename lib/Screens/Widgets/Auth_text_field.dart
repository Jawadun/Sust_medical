import 'package:flutter/material.dart';

class Auth_text_field extends StatelessWidget {
  final String text;
  final String icon;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType; 

  const Auth_text_field({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    required this.isPassword,
    this.keyboardType = TextInputType.text, 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Image.asset(icon, width: 20, height: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Textfrom extends StatelessWidget {
  final bool isObcure;
  final String text;
  final Widget icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool passwordVisibl;
  const Textfrom({
    super.key,
    required this.text,
    required this.icon,
  
    required this.isObcure,
    required this.controller,
    this.validator,
    required this.passwordVisibl,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObcure,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: icon,
    
      ),
      validator: validator,
    );
  }
}

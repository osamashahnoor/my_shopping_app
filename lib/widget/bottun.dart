import 'package:flutter/material.dart';

class Bouton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  final Size? fixedSize;
  final Color color;
  final String fontFamily;

  const Bouton({
    super.key,
    required this.text,
    required this.onpress,
    this.fixedSize,
    required this.color, 
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize,
        backgroundColor: color,
        foregroundColor: Colors.white,
  
      ),
      child: Text(text, style: TextStyle(fontFamily: fontFamily)),
    );
  }
}

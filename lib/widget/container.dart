import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Gradient? gradient;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape shape;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final EdgeInsetsGeometry? margin; 

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.gradient,
    this.child,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.boxShadow,
    this.border,
    this.margin, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin, 
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
        shape: shape,
        boxShadow: boxShadow,
        border: border,
      ),
      child: child,
    );
  }
}

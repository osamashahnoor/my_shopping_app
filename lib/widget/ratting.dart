import 'package:flutter/material.dart';
import 'package:my_shopping_app/widget/icons.dart';


class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
      
          if (index < rating) {
            return const Icon(
              MyAppIcons.star, 
              color: Colors.amber,
                size: 14,
            );
          } else if (index < rating + 0.5) {
            return const Icon(
              MyAppIcons.starhalf, 
              color: Colors.grey,
              size: 16.0, 
            );
          } else {
            return const Icon(
              MyAppIcons.star, 
              color: Colors.grey,
              size: 16, 
            );
          }
        },
      ),
    );
  }
}

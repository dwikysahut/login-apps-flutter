import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: size,
          color: Colors.yellow[800],
        ),
        Icon(
          Icons.star,
          size: size,
          color: Colors.yellow[800],
        ),
        Icon(
          Icons.star,
          size: size,
          color: Colors.yellow[800],
        ),
        Icon(
          Icons.star,
          size: size,
          color: Colors.yellow[800],
        ),
        Icon(
          Icons.star_border,
          size: size,
          color: Colors.yellow[800],
        ),
      ],
    );
  }
}

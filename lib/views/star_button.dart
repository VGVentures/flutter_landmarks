import 'package:flutter/material.dart';

class StarButton extends StatelessWidget {
  StarButton({this.isFavorite = false, this.onTap});

  final bool isFavorite;
  final ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: isFavorite
          ? Icon(Icons.star, color: const Color(0xFFFFD700))
          : Icon(Icons.star_border),
      onTap: () => onTap(!isFavorite),
    );
  }
}

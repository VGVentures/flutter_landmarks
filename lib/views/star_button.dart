import 'package:flutter/material.dart';

class StarButton extends StatelessWidget {
  StarButton({Key key, this.isFavorite = false, this.onTap}) : super(key: key);

  final bool isFavorite;
  final ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: isFavorite
          ? const Icon(Icons.star, color: const Color(0xFFFFD700))
          : const Icon(Icons.star_border, color: Colors.grey),
      onTap: () {
        if (onTap != null) {
          onTap(!isFavorite);
        }
      },
    );
  }
}

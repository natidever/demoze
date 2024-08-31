import 'package:Demoz/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final Color badgeColor;
  final String text;
  final iconSource;

  const CustomBadge(
      {required this.badgeColor, required this.text, this.iconSource});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 38,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(width: 20, height: 18, iconSource ?? ''),
          Text(
            text,
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

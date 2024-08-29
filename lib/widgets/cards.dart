import 'package:demoze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget DashboardCard(
    {Color? backgroudColor,
    Color? borderColor,
    String? description,
    String? content,
    Color? textColor}) {
  return Container(
    width: 162,
    height: 113,
    decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor ?? white)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description ?? '',
            style:
                GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            content ?? '',
            style: GoogleFonts.lexend(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
          )
        ],
      ),
    ),
  );
}

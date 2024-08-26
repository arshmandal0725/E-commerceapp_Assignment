import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Products",
            style: GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text(
            "Super summer sale",
            style: GoogleFonts.lato(fontSize: 11, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

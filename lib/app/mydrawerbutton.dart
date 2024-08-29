import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;

  const MyDrawerButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: screenwidth * 0.05,
                shadows: [
                   const Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 3,
                    color: Color.fromARGB(128, 0, 0, 0),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

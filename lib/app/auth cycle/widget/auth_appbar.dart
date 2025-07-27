import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthAppbar extends StatelessWidget {
  const AuthAppbar({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 48,
              ),
              child: Container(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: GoogleFonts.montserrat.toString(),
                      ),
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: GoogleFonts.montserrat.toString(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset("assets/imgs/Union.png", width: 120),
          ],
        ),
      ),
    );
  }
}

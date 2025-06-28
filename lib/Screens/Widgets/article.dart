import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:medical/Screens/Views/articlePage.dart'; // make sure this exists

class article extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  const article({
    super.key,
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.1;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const articlePage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Container(
          height: containerHeight,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE7E7E7)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5),

              SizedBox(
                height: containerHeight * 0.8,
                width: containerHeight * 0.8,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 15),

              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      mainText,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          dateText,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          duration,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF008866),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 25),

              SizedBox(
                height: containerHeight * 0.6,
                width: containerHeight * 0.6,
                child: Image.asset(
                  "lib/icons/Bookmark.png",
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

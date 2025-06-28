import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class shedule_card extends StatelessWidget {
  final String mainText;
  final String subText;
  final String image;
  final String date;
  final String time;
  final String confirmation;

  const shedule_card({
    super.key,
    required this.mainText,
    required this.subText,
    required this.date,
    required this.confirmation,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        padding: const EdgeInsets.all(12), 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainText,
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subText,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 99, 99, 99),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(image),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.07,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/icons/callender2.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  date,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.07,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/icons/watch.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.width * 0.07,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/icons/elips.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  confirmation,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.045,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 233, 233),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 61, 61, 61),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.045,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 4, 190, 144),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Reschedule",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 252, 252, 252),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

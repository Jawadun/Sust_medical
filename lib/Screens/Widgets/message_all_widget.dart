import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class message_all_widget extends StatelessWidget {
  final String Maintext;
  final String subtext;
  final String image;
  final String time;
  final String message_count;

  const message_all_widget({
    super.key,
    required this.Maintext,
    required this.subtext,
    required this.image,
    required this.message_count,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), 
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08, 
        width: MediaQuery.of(context).size.width * 0.9,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            const SizedBox(width: 10),

            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Maintext,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtext,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: GoogleFonts.poppins(fontSize: 11),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 2, 134, 117),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      message_count,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

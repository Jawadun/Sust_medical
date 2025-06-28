import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/doctor_details_screen.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class appointment extends StatelessWidget {
  const appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const DoctorDetails(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset("lib/icons/back1.png"),
          ),
        ),
        title: Text(
          "Top Doctors",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset("lib/icons/more.png"),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const doctorList(
                distance: "800m away",
                image: "lib/icons/male-doctor.png",
                maintext: "Dr. ABC",
                numRating: "4.7",
                subtext: "Cardiologist",
              ),
              const SizedBox(height: 10),
              _buildLabelRow("Date", "Change"),
              const SizedBox(height: 10),
              _buildInfoRow(
                  context, "lib/icons/callender.png", "Wednesday, Jun 23, 2021 | 10:00 AM"),
              const SizedBox(height: 20),
              _buildLabelRow("Reasion", "Change"),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.black12),
              ),
              const SizedBox(height: 10),
              _buildInfoRow(context, "lib/icons/pencil.png", "Chest pain"),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.black12),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Payment Details",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildPriceRow("Consultation", "\$60"),
              _buildPriceRow("Admin Fee", "\$01.00"),
              _buildPriceRow("Additional Discount", "-"),
              const SizedBox(height: 15),
              _buildPriceRow(
                "Total",
                "\$61.00",
                bold: true,
                color: const Color.fromARGB(255, 4, 92, 58),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(color: Colors.black12),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Payment Method"),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Visa",
                        style: GoogleFonts.inter(
                          fontStyle: FontStyle.italic,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 38, 39, 117),
                        ),
                      ),
                      Text(
                        "Change",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(137, 56, 56, 56),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.inter(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(137, 56, 56, 56),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$61",
                            style: GoogleFonts.inter(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Successfully booked"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: const Homepage(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 2, 179, 149),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Book",
                              style: GoogleFonts.poppins(
                                fontSize: 15.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          Text(
            right,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(137, 56, 56, 56),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String iconPath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 247, 247),
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(iconPath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value,
      {bool bold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: bold ? Colors.black87 : Colors.black54,
              fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

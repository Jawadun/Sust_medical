import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/ambulance_screen.dart';
import 'package:medical/Screens/Views/checkup_screen.dart';
import 'package:medical/Screens/Views/doctor_search.dart';
import 'package:medical/Screens/Views/find_doctor.dart';
import 'package:medical/Screens/Views/medicine_screen.dart';
import 'package:medical/Screens/Widgets/article.dart';
import 'package:medical/Screens/Widgets/banner.dart';
import 'package:medical/Screens/Widgets/list_doctor1.dart';
import 'package:medical/Screens/Widgets/listicons.dart';
import 'package:medical/Screens/Views/articlePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()),
                );
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                child: Image.asset(
                  "lib/icons/bell.png",
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              "Find your desire\nhealth solution",
              style: GoogleFonts.inter(
                  color: const Color.fromARGB(255, 51, 47, 47),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ],
        ),
        toolbarHeight: 130,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const doctor_search(),
                      ),
                    );
                  },
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.none,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    focusColor: Colors.black26,
                    fillColor: const Color.fromARGB(255, 247, 247, 247),
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: Image.asset(
                          "lib/icons/search.png",
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
                    label: const Text("Search doctor, drugs, articles..."),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                listIcons(
                  Icon: "lib/icons/Doctor.png",
                  text: "Doctor",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const find_doctor(),
                      ),
                    );
                  },
                ),
                listIcons(
                  Icon: "lib/icons/Pharmacy.png",
                  text: "Medicine",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicineScreen(),
                      ),
                    );
                  },
                ),
                listIcons(
                  Icon: "lib/icons/Hospital.png",
                  text: "Check Up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckUpScreen(),
                      ),
                    );
                  },
                ),
                listIcons(
                  Icon: "lib/icons/Ambulance.png",
                  text: "Ambulance",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AmbulanceScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),
            const banner(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctor",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 46, 46, 46),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const find_doctor(),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: const Color.fromARGB(255, 3, 190, 150),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 180,
                width: 400,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    list_doctor1(
                        distance: "130m Away",
                        image: "lib/icons/male-doctor.png",
                        maintext: "Dr. Marcus Horizon",
                        numRating: "4.7",
                        subtext: "Cardiologist"),
                    list_doctor1(
                        distance: "130m Away",
                        image: "lib/icons/docto3.png",
                        maintext: "Dr. Maria Elena",
                        numRating: "4.6",
                        subtext: "Psychologist"),
                    list_doctor1(
                        distance: "2km away",
                        image: "lib/icons/doctor2.png",
                        maintext: "Dr. Stevi Jessi",
                        numRating: "4.8",
                        subtext: "Orthopedist"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Health article",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 46, 46, 46),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const articlePage(),
                        ),
                      );
                    },
                    child: Text(
                      "See all",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: const Color.fromARGB(255, 3, 190, 150),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            const article(
              image: "images/article1.png",
              dateText: "Jun 10, 2021 ",
              duration: "5min read",
              mainText:
                  "The 25 Healthiest Fruits You Can Eat,\nAccording to a Nutritionist",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: const Center(
        child: Text(
          "No notifications yet.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

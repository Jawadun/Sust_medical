import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/doctor_details_screen.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:medical/Screens/Widgets/listicons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class find_doctor extends StatefulWidget {
  const find_doctor({super.key});

  @override
  State<find_doctor> createState() => _find_doctorState();
}

class _find_doctorState extends State<find_doctor> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> doctors = [
    {
      "name": "Dr. Marcus Horizon",
      "distance": "800m away",
      "image": "lib/icons/male-doctor.png",
      "rating": "4.7",
      "specialty": "Cardiologist",
    },
    {
      "name": "Dr. Maria Elena",
      "distance": "1.2km away",
      "image": "lib/icons/female-doctor.png",
      "rating": "4.6",
      "specialty": "Psychiatrist",
    },
    {
      "name": "Dr. Stevi Jessi",
      "distance": "2km away",
      "image": "lib/icons/doctor2.png",
      "rating": "4.8",
      "specialty": "Orthopedist",
    },
  ];

  List<Map<String, String>> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors; 
    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();
      setState(() {
        filteredDoctors = doctors.where((doctor) {
          final nameLower = doctor["name"]!.toLowerCase();
          final specialtyLower = doctor["specialty"]!.toLowerCase();
          return nameLower.contains(query) || specialtyLower.contains(query);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset("lib/icons/back2.png")),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Find Doctor",
          style: GoogleFonts.inter(
              color: const Color.fromARGB(255, 51, 47, 47),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        toolbarHeight: 130,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _searchController,
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                obscureText: false,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: Colors.black26,
                  fillColor: const Color.fromARGB(255, 247, 247, 247),
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.02,
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
          filteredDoctors.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "No doctors found.",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = filteredDoctors[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const DoctorDetails()));
                      },
                      child: doctorList(
                        distance: doctor["distance"] ?? "",
                        image: doctor["image"] ?? "",
                        maintext: doctor["name"] ?? "",
                        numRating: doctor["rating"] ?? "",
                        subtext: doctor["specialty"] ?? "",
                      ),
                    );
                  },
                ),
        ]),
      ),
    );
  }
}

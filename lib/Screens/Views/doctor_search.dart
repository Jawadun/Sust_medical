import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:medical/Screens/Views/doctor_details_screen.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class doctor_search extends StatefulWidget {
  const doctor_search({super.key});

  @override
  State<doctor_search> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<doctor_search> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  final List<Map<String, String>> doctors = [
    {
      "type": "doctor",
      "distance": "800m Away",
      "image": "lib/icons/male-doctor.png",
      "name": "Dr. Marcus Horizon",
      "rating": "4.7",
      "speciality": "Cardiologist",
    },
    {
      "type": "doctor",
      "distance": "500m Away",
      "image": "lib/icons/doctor2.png",
      "name": "Dr. John Smith",
      "rating": "4.5",
      "speciality": "Dermatologist",
    },
  ];

  final List<Map<String, String>> medicines = [
    {
      "type": "medicine",
      "name": "Paracetamol",
      "description": "Pain reliever and fever reducer",
    },
    {
      "type": "medicine",
      "name": "Ibuprofen",
      "description": "Reduces inflammation and pain",
    },
    {
      "type": "medicine",
      "name": "Amoxicillin",
      "description": "Antibiotic for bacterial infections",
    },
    {
      "type": "medicine",
      "name": "Cetirizine",
      "description": "Allergy relief medication",
    },
  ];

  final List<Map<String, String>> appointments = [
    {
      "type": "appointment",
      "doctor": "Dr. ABC",
      "reason": "Chest pain",
      "date": "Wednesday, Jun 23, 2021 | 10:00 AM",
    },
    {
      "type": "appointment",
      "doctor": "Dr. XYZ",
      "reason": "Fever",
      "date": "Friday, Jul 1, 2022 | 2:00 PM",
    },
  ];

  final List<Map<String, String>> articles = [
    {
      "type": "article",
      "title": "5 Tips for Heart Health",
      "summary": "Learn how to take care of your heart with simple habits.",
    },
    {
      "type": "article",
      "title": "Understanding Allergies",
      "summary": "A guide to managing seasonal allergies effectively.",
    },
  ];

  List<Map<String, String>> get allItems =>
      [...doctors, ...medicines, ...appointments, ...articles];

  List<Map<String, String>> get filteredItems {
    if (_searchQuery.isEmpty) return [];

    final query = _searchQuery.toLowerCase();

    return allItems.where((item) {
      switch (item['type']) {
        case 'doctor':
          return (item['name']?.toLowerCase().contains(query) ?? false) ||
              (item['speciality']?.toLowerCase().contains(query) ?? false);
        case 'medicine':
          return (item['name']?.toLowerCase().contains(query) ?? false) ||
              (item['description']?.toLowerCase().contains(query) ?? false);
        case 'appointment':
          return (item['doctor']?.toLowerCase().contains(query) ?? false) ||
              (item['reason']?.toLowerCase().contains(query) ?? false) ||
              (item['date']?.toLowerCase().contains(query) ?? false);
        case 'article':
          return (item['title']?.toLowerCase().contains(query) ?? false) ||
              (item['summary']?.toLowerCase().contains(query) ?? false);
        default:
          return false;
      }
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildResultItem(Map<String, String> item) {
    switch (item['type']) {
      case 'doctor':
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: const DoctorDetails(),
            ),
          ),
          child: doctorList(
            distance: item['distance'] ?? '',
            image: item['image'] ?? '',
            maintext: item['name'] ?? '',
            numRating: item['rating'] ?? '',
            subtext: item['speciality'] ?? '',
          ),
        );
      case 'medicine':
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.medication_outlined, color: Colors.teal),
            title: Text(item['name']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            subtitle: Text(item['description']!),
          ),
        );
      case 'appointment':
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.deepPurple),
            title: Text(item['doctor']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            subtitle: Text("${item['date']} | Reason: ${item['reason']}"),
          ),
        );
      case 'article':
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.article_outlined, color: Colors.blue),
            title: Text(item['title']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            subtitle: Text(item['summary']!),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageTransition(type: PageTransitionType.fade, child: const Homepage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset("lib/icons/back1.png"),
          ),
        ),
        title: Text("Search", style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search doctors, medicines, articles...",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.trim();
                  });
                },
              ),
            ),
            Expanded(
              child: _searchQuery.isEmpty
                  ? Center(
                      child: Text("Start typing to search...",
                          style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.grey)),
                    )
                  : filteredItems.isEmpty
                      ? Center(
                          child: Text("No results found.",
                              style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.grey)),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) =>
                              _buildResultItem(filteredItems[index]),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

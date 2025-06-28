import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckUpScreen extends StatelessWidget {
  const CheckUpScreen({super.key});

  final List<Map<String, String>> checkUps = const [
    {"name": "General Checkup", "details": "Basic health examination"},
    {"name": "Cardiology Checkup", "details": "Heart and blood vessel health"},
    {"name": "Diabetes Screening", "details": "Blood sugar level check"},
    {"name": "Dental Checkup", "details": "Oral health assessment"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check Ups")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: checkUps.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final checkUp = checkUps[index];
          return ListTile(
            leading: const Icon(Icons.check_circle_outline, color: Colors.blue),
            title: Text(
              checkUp["name"]!,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(checkUp["details"]!),
          );
        },
      ),
    );
  }
}

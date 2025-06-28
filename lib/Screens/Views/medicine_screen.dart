import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  final List<Map<String, String>> medicines = const [
    {"name": "Paracetamol", "description": "Pain reliever and fever reducer"},
    {"name": "Ibuprofen", "description": "Reduces inflammation and pain"},
    {"name": "Amoxicillin", "description": "Antibiotic for bacterial infections"},
    {"name": "Cetirizine", "description": "Allergy relief medication"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medicines")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: medicines.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return ListTile(
            leading: const Icon(Icons.medical_services, color: Colors.teal),
            title: Text(
              medicine["name"]!,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(medicine["description"]!),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  final List<Map<String, String>> ambulanceServices = const [
    {
      "service": "Ambulane 1",
      "contact": "01723456789",
      "description": "Driver: Rahimul"
    },
    {
      "service": "Ambulane 2",
      "contact": "01723456789",
      "description": "Driver: Rahim"
    },
    {
      "service": "Ambulane 3",
      "contact": "01723456789",
      "description": "Driver: Karim"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ambulance Services")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: ambulanceServices.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final service = ambulanceServices[index];
          return ListTile(
            leading: const Icon(Icons.local_hospital, color: Colors.red),
            title: Text(
              service["service"]!,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            subtitle: Text("${service["description"]!}\nContact: ${service["contact"]!}"),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}

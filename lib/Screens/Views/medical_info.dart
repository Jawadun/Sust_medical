import 'package:flutter/material.dart';

class MedicalInfoScreen extends StatelessWidget {
  const MedicalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mockMedicalInfo = {
      'Blood Group': 'A+',
      'Allergies': 'Pollen, Dust',
      'Chronic Conditions': 'Asthma',
      'Medications': 'Albuterol',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Info'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: mockMedicalInfo.entries.map((entry) {
          return Card(
            child: ListTile(
              title: Text(entry.key),
              subtitle: Text(entry.value),
              leading: const Icon(Icons.medical_services),
            ),
          );
        }).toList(),
      ),
    );
  }
}

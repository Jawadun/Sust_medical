import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'How to book an appointment?',
        'answer': 'Go to the doctor page, select a doctor, and click "Book Appointment".',
      },
      {
        'question': 'How to reset password?',
        'answer': 'Click "Forgot Password" on the login screen to reset it via email.',
      },
      {
        'question': 'Can I cancel appointments?',
        'answer': 'Yes, go to Appointments and tap on the appointment to cancel it.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqs[index]['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(faqs[index]['answer']!),
              )
            ],
          );
        },
      ),
    );
  }
}

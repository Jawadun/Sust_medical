import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final List<Map<String, String>> notifications = const [
    {
      'title': 'Appointment Reminder',
      'body': 'You have an appointment with Dr. Smith tomorrow at 10 AM.',
      'time': '1 hour ago',
    },
    {
      'title': 'New Article Available',
      'body': 'Read about the benefits of Vitamin D in our latest article.',
      'time': '3 hours ago',
    },
    {
      'title': 'Medicine Discount',
      'body': 'Get 20% off on your next purchase at the pharmacy.',
      'time': 'Yesterday',
    },
    {
      'title': 'Health Tip',
      'body': 'Drink at least 8 glasses of water every day for better health.',
      'time': '2 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.teal),
            title: Text(
              notification['title'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(notification['body'] ?? ''),
            trailing: Text(
              notification['time'] ?? '',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped: ${notification['title']}')),
              );
            },
          );
        },
      ),
    );
  }
}

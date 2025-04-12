

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../models/notification/NotificationData.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample list of notifications
  List<NotificationData> notifications = [
    NotificationData(
        notification_title: 'Welcome', notification_text: 'Thanks for joining our app!'),
    NotificationData(
        notification_title: 'Update Available', notification_text: 'A new version is ready to download.'),
    NotificationData(
        notification_title: 'Reminder', notification_text: 'Don\'t forget your meeting at 3 PM today.'),
  ];

  void _removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return NotificationCard(
          title: item.notification_title,
          body: item.notification_text,
          onClose: () => _removeNotification(index),
        );
      },
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onClose;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.body,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.notifications_active_outlined,
                color: Colors.orange, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    body,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onClose,
              child: const Icon(Icons.close, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/list_data.dart';
import '../../widget/list_view_item.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text('Weather Notifications'),
      ),
      body: ListView.builder(
        itemCount: notificationsItems.length,
        itemBuilder: (context, index) {
          final notification = notificationsItems[index];

          return ListviewItem(
            image: notification.image ?? '',
            title: notification.title ?? 'No Title',
            description: notification.description ?? 'No Description',
          );
        },
      ),
    );
  }
}

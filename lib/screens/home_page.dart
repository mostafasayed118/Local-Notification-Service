import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notification_app/screens/notification_details.dart';
import 'package:notification_app/service/local_notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    listenToNotificationStream();
  }

  void listenToNotificationStream() {
    LocalNotificationService.streamController.stream
        .listen((notificationResponse) {
      log('Notification Response: ${notificationResponse.notificationResponseType}');
      log('Notification Response: ${notificationResponse.id}');
      log('Notification Response: ${notificationResponse.actionId}');
      log('Notification Response: ${notificationResponse.input}');
      log('Notification Response: ${notificationResponse.payload}');
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return NotificationDetailsScreen(
          response: notificationResponse,
        );
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notification App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Flutter Notification App'),
            const SizedBox(
              height: 20,
            ),

            //! Basic Notification

            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Basic Notification '),
              trailing: IconButton(
                  onPressed: () {
                    LocalNotificationService.cancelNotification(0);
                  },
                  icon: const Icon(Icons.highlight_remove),
                  color: Colors.red),
              onTap: () {
                LocalNotificationService.showBasicNotification();
              },
            ),

            //! Repeated Notification

            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Repeated Notification'),
              trailing: IconButton(
                  onPressed: () {
                    LocalNotificationService.cancelNotification(1);
                  },
                  icon: const Icon(Icons.highlight_remove),
                  color: Colors.red),
              onTap: () {
                LocalNotificationService.showRepeatedNotification();
              },
            ),

            //! Scheduled Notification

            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Scheduled Notification'),
              trailing: IconButton(
                  onPressed: () {
                    LocalNotificationService.cancelNotification(2);
                  },
                  icon: const Icon(Icons.highlight_remove),
                  color: Colors.red),
              onTap: () {
                LocalNotificationService.showScheduledNotification();
              },
            ),

            //! Cancel All Notification
            ElevatedButton(
              onPressed: () {
                LocalNotificationService.cancelAllNotification();
              },
              child: const Text('Cancel All Notification'),
            ),
          ],
        ),
      ),
    );
  }
}

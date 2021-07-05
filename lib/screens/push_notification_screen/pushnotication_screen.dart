import 'package:flutter/material.dart';

class PushNotification extends StatefulWidget {
  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Push Notification',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}

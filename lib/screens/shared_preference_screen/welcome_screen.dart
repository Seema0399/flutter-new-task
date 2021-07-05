import 'package:flutter/material.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:flutter_task_new/utils/font.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          StringResource.welcome,
          style: TextStyle(
            fontSize: FontSize.twenty,
          ),
        ),
      ),
    );
  }
}

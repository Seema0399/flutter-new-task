import 'package:flutter/material.dart';

import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.hometext),
      ),
      body: Center(
        child: Text(StringResource.hometext,
            style: TextStyle(
              fontSize: FontSize.twenty,
            )),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/tap_to_speak_screen/tap_to_speak_screen.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatefulWidget {
  @override
  _LottieViewState createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lottie Animation',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TapToSpeak()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Lottie.asset('assets/lottiefile.json'),
            ),
          ],
        ),
      ),
    );
  }
}

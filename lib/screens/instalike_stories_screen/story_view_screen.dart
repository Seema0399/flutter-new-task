import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/instalike_stories_screen/storydata.dart';
import 'dart:async';

import 'package:flutter_task_new/utils/font.dart';

class StoryView extends StatefulWidget {
  final StoryData story;
  StoryView({Key key, @required this.story}) : super(key: key);

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  double percent = 0;
  Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(microseconds: 10), (timer) {
      setState(() {
        percent += 0.001;
        if (percent > 1) {
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.story.storyUrl),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 36, horizontal: 8),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: percent,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.story.avatarUrl),
                    radius: 30,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.story.userName,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeights.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}

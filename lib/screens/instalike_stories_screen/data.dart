import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/instalike_stories_screen/story_view_screen.dart';
import 'package:flutter_task_new/screens/instalike_stories_screen/storydata.dart';

Widget storyButton(StoryData story, BuildContext context) {
  return Column(
    children: [
      InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StoryView(story: story)));
        },
        child: Container(
          width: 70,
          height: 70,
        ),
      )
    ],
  );
}

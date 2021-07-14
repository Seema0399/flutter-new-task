import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViews extends StatefulWidget {
  @override
  _StoryViewsState createState() => _StoryViewsState();
}

class _StoryViewsState extends State<StoryViews> {
  final controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoryView(
        storyItems: [
          StoryItem.text(title: 'Hello World', backgroundColor: Colors.grey),
          StoryItem.pageImage(
              url:
                  'https://www.wallpapertip.com/wmimgs/8-82164_soothing-background.jpg',
              controller: controller)
        ],
        inline: false,
        controller: controller,
        repeat: false,
      ),
    );
  }
}

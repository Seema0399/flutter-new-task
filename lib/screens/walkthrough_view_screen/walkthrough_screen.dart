import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/share_intent_screen/share_intent_screen.dart';
import 'package:walkthrough/walkthrough.dart';
import 'package:walkthrough/flutterwalkthrough.dart';

class Walkthroughview extends StatelessWidget {
  final List<Walkthrough> list = [
    Walkthrough(
      title: "Title 1",
      content: "Content 1",
      imageIcon: Icons.restaurant_menu,
    ),
    Walkthrough(
      title: "Title 2",
      content: "Content 2",
      imageIcon: Icons.search,
    ),
    Walkthrough(
      title: "Title 3",
      content: "Content 3",
      imageIcon: Icons.shopping_cart,
    ),
    Walkthrough(
      title: "Title 4",
      content: "Content 4",
      imageIcon: Icons.verified_user,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShareIntent()));
            },
          )
        ],
      ),
      body: IntroScreen(
        list,
        MaterialPageRoute(builder: (context) => Walkthroughview()),
      ),
    );
  }
}

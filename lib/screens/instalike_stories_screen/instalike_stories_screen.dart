import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/instalike_stories_screen/data.dart';
import 'package:flutter_task_new/screens/instalike_stories_screen/storydata.dart';
import 'package:flutter_task_new/screens/youtube_player_screen/youtube_player_screen.dart';

class InstaLike extends StatefulWidget {
  @override
  _InstaLikeState createState() => _InstaLikeState();
}

class _InstaLikeState extends State<InstaLike> {
  List<StoryData> stories = [
    new StoryData(
        'SeemaSenthil',
        'https://www.androidhits.com/wp-content/uploads/2016/05/instagram-new-logo.jpg',
        'https://www.hdwallpaper.nu/wp-content/uploads/2015/06/1843513.jpg'),
    new StoryData(
        'SeemaSuja',
        'http://getdrawings.com/free-icon/funny-profile-icons-62.png',
        'http://www.decorationlove.com/wp-content/uploads/2016/10/Smalll-Orange-Chirstmas-Design.jpg'),
    new StoryData(
        'Seema',
        'https://www.seekpng.com/png/detail/202-2024729_facebook-profile-icon-png-facebook-profile-logo-transparent.png',
        'https://www.thewowdecor.com/wp-content/uploads/2017/09/Chalkboard-Christmas-Wreath.jpg'),
    new StoryData(
        'MaheSeema',
        'https://images-na.ssl-images-amazon.com/images/I/91c5vXSKGOL.png',
        'https://ofriendly.com/wp-content/uploads/2017/06/paper-flowers/16-paper-flower-diy-ideas-tutorials.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPage()));
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                storyButton(stories[0], context),
                storyButton(stories[1], context),
                storyButton(stories[2], context),
                storyButton(stories[3], context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

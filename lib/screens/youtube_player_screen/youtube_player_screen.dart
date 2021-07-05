import 'dart:ui';
import 'package:flutter_task_new/screens/email_call_screen/email_call_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({this.title, this.url});
  final String title;
  final url;
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '8n0M3HQ3dbo',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Youtube',
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
                  MaterialPageRoute(builder: (context) => EmailCall()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Youtube Player',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}

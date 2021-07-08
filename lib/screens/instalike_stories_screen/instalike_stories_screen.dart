import 'package:flutter_task_new/screens/email_call_screen/email_call_screen.dart';
import 'package:social_share/social_share.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';

class InstaLike extends StatefulWidget {
  @override
  _InstaLikeState createState() => _InstaLikeState();
}

class _InstaLikeState extends State<InstaLike> {
  @override
  void initState() {
    super.initState();
  }

  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
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
      body: Screenshot(
        controller: screenshotController,
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () async {
                  PickedFile file =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  SocialShare.shareInstagramStory(
                    file.path,
                    backgroundTopColor: "#ffffff",
                    backgroundBottomColor: "#000000",
                    attributionURL: "https://www.instagram.com/",
                  ).then((data) {
                    print(data);
                  });
                },
                child: Text("Share On Instagram Story"),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  screenshotController
                      .capture(delay: Duration(milliseconds: 20))
                      .then((image) async {
                    Directory tempDir = await getTemporaryDirectory();
                    String filepath = '${tempDir.path}/insta.jpg';
                    File(filepath).writeAsBytes(image);
                    SocialShare.shareInstagramStory(
                      filepath,
                      backgroundTopColor: '#ffffff',
                      backgroundBottomColor: '#000000',
                      attributionURL: "https://www.instagram.com/",
                    ).then((data) {
                      print(data);
                    });
                  });
                },
                child: Text('Share Insta Story'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

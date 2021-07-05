import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/offline_storage_screen/offline_storage_screen.dart';
import 'package:share/share.dart';

class ShareIntent extends StatefulWidget {
  @override
  _ShareIntentState createState() => _ShareIntentState();
}

class _ShareIntentState extends State<ShareIntent> {
  String text = '';
  String subject = '';

  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ShareIntent',
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
                  MaterialPageRoute(builder: (context) => OfflineStorage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Text',
                hintText: 'Enter some text or link to Share',
              ),
              maxLines: 2,
              onChanged: (String txt) {
                setState(() {
                  text = 'txt';
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Text',
                hintText: 'Enter some subject or link to Share',
              ),
              maxLines: 2,
              onChanged: (String txt) {
                setState(() {
                  subject = 'txt';
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  child: Text('Share'),
                  onPressed: text.isEmpty
                      ? null
                      : () {
                          share(context);
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

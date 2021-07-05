import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/location_mapmarker_screen/location_access.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadUrl extends StatefulWidget {
  @override
  _LoadUrlState createState() => _LoadUrlState();
}

class _LoadUrlState extends State<LoadUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.url,
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
                  MaterialPageRoute(builder: (context) => LocationAccess()));
            },
          ),
        ],
      ),
      // ignore: deprecated_member_use
      body: Column(
        children: [
          // ignore: deprecated_member_use
          RaisedButton(
            child: Text(StringResource.url),
            onPressed: () {
              openurl();
            },
          ),
          // ignore: deprecated_member_use
        ],
      ),
    );
  }

  openurl() {
    String url1 = "https:google.com";
    launch(url1);
  }
}

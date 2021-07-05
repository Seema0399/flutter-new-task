import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/location_mapmarker_screen/google_map.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class LocationAccess extends StatefulWidget {
  @override
  _LocationAccessState createState() => _LocationAccessState();
}

class _LocationAccessState extends State<LocationAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.location),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              StringResource.demo,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: FontSize.twentyfour,
                fontWeight: FontWeights.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => GooogleMap())),
        tooltip: 'Google Map',
        child: Icon(Icons.pin_drop_outlined),
      ),
    );
  }
}

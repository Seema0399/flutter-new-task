import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/api_flutter_screen/get_api_screen.dart';
import 'package:flutter_task_new/screens/shared_preference_screen/home_screen.dart';
import 'package:flutter_task_new/screens/shared_preference_screen/welcome_screen.dart';
import 'package:flutter_task_new/utils/color_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SharedPreference',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            color: ColorResources.colorFFFFFF,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GetApi()));
            },
          )
        ],
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          child: Text(
            StringResource.proceed,
            style: TextStyle(color: ColorResources.colorFFFFFF),
          ),
          color: ColorResources.color03A9F4,
          onPressed: () async {
            bool visitingFlag = await getVisitingFlag();
            setVisitingFlag();

            if (visitingFlag == true) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }
          },
        ),
      ),
    );
  }
}

setVisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('alreadyVisited', true);
}

getVisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool alreadyVisited = preferences.getBool('alreadyVisited') ?? false;
  return alreadyVisited;
}

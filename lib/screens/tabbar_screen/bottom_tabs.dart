import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/contact_access_screen/contact_access.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _currentIndex = 0;
  final tabs = [
    Center(child: Text(StringResource.home)),
    Center(child: Text(StringResource.camera)),
    Center(child: Text(StringResource.search)),
    Center(child: Text(StringResource.person)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.bottom,
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
                  MaterialPageRoute(builder: (context) => ContactAccess()));
            },
          ),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text(StringResource.home),
            backgroundColor: ColorResources.color90CAF9,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            // ignore: deprecated_member_use
            title: Text(StringResource.camera),
            backgroundColor: ColorResources.color90CAF9,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // ignore: deprecated_member_use
            title: Text(StringResource.search),
            backgroundColor: ColorResources.color90CAF9,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text(StringResource.person),
            backgroundColor: ColorResources.color90CAF9,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

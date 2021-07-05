import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/search_list_screen/search_list.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class BottomTask extends StatefulWidget {
  @override
  _BottomTaskState createState() => _BottomTaskState();
}

class _BottomTaskState extends State<BottomTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.bottomsheet,
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
                  MaterialPageRoute(builder: (context) => SearchList()));
            },
          )
        ],
      ),
      body: Builder(
        builder: (context) => Center(
          // ignore: deprecated_member_use
          child: RaisedButton(
            child: Text(StringResource.showbottomsheet),
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (BuildContext bContext) {
                  return Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text(StringResource.home),
                        ),
                        ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text(StringResource.dashboard),
                        ),
                        ListTile(
                          leading: Icon(Icons.info),
                          title: Text(StringResource.about),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(StringResource.profile),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text(StringResource.logout),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

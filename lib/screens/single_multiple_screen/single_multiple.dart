import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/single_multiple_screen/multiple_selection.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'single_selection.dart';

class SingleMultiple extends StatefulWidget {
  @override
  _SingleMultipleState createState() => _SingleMultipleState();
}

class _SingleMultipleState extends State<SingleMultiple> {
  List<String> sortFilter = [
    'Sort by name A-Z',
    'Sort by release date',
    'Sort by Ratings',
    'Sort by recently added',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.singlemultiple,
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
                  MaterialPageRoute(builder: (context) => MultipleSelection()));
            },
          ),
        ],
      ),
      body: SingleSelection(sortFilter),
    );
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(StringResource.list),
            actions: <Widget>[
              Text(StringResource.ok),
              Text(StringResource.cancel),
            ],
            content: Container(
              width: 300,
              height: 400,
              child: SingleSelection(sortFilter),
            ),
          );
        });
  }
}

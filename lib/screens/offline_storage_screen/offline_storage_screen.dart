import 'dart:io';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/shared_preference_screen/shared_preference.dart';
import 'package:path_provider/path_provider.dart';

class OfflineStorage extends StatefulWidget {
  @override
  _OfflineStorageState createState() => _OfflineStorageState();
}

class _OfflineStorageState extends State<OfflineStorage> {
  String data;
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Reading file
      String contents = await file.readAsString();
      // returning the contents of the file
      return contents;
    } catch (e) {
      // if encounter error then, return
      return 'Error';
    }
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    // writing file
    return file.writeAsString('hello hii');
  }

  @override
  void initState() {
    super.initState();
    writeContent();
    readContent();
    readContent().then((String value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Offline Storage',
          style: TextStyle(
            fontFamily: 'Popppins',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SharedPreference()));
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Data reading from the file: \n $data',
        ),
      ),
    );
  }
}

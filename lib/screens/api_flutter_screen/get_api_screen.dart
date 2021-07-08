import 'dart:convert';

import 'package:flutter_task_new/screens/postapi_screen/postapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String stringResponse;

class GetApi extends StatefulWidget {
  @override
  _GetApiState createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  getUserData() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u['name'], u['email'], u['userName']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostApi()));
              },
            )
          ],
          title: Text(
            'API',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Card(
              child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                    child: Center(
                  child: Text('Loading..'),
                ));
              } else
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data[i].name),
                      );
                    });
            },
          )),
        ));
  }
}

class User {
  final String name, email, userName;
  User(this.name, this.email, this.userName);
}

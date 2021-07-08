import 'datamodels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApi extends StatefulWidget {
  @override
  _PostApiState createState() => _PostApiState();
}

Future<DataModel> submitData(String name, String job) async {
  var response = await http.post(Uri.https('reqres.in', 'api/users'),
      body: {"name": name, 'job': job});
  var data = response.body;
  print(data);

  if (response.statusCode == 200) {
    String responseString = response.body;
    dataModelFromJson(responseString);
  } else
    return null;
}

class _PostApiState extends State<PostApi> {
  DataModel _dataModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          'Post Api',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text here',
              ),
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Jobname here',
              ),
              controller: jobController,
            ),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String job = jobController.text;
                DataModel data = await submitData(name, job);
                setState(() {
                  _dataModel = data;
                });
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

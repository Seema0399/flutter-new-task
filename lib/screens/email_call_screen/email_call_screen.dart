import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/walkthrough_view_screen/walkthrough_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailCall extends StatefulWidget {
  @override
  _EmailCallState createState() => _EmailCallState();
}

class _EmailCallState extends State<EmailCall> {
  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch Url';
    }
  }

  void _launchCaller(int number) async {
    var url = "tel:${number.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not make Call';
    }
  }

  void _launchEmail(String emailId) async {
    var url = "mailto:$emailId?subject = HelloWorld Email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Send Email';
    }
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
                  MaterialPageRoute(builder: (context) => Walkthroughview()));
            },
          )
        ],
        title: Text(
          'EmailCall',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: Text('Website'),
                onPressed: () {
                  _launchUrl('www.google.com');
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Phone'),
                onPressed: () {
                  _launchCaller(123456789);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Email'),
                onPressed: () {
                  _launchEmail('info@gmail.com');
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

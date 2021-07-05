import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/bottom_sheet_screen/bottom_task.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  Color bulbColor = ColorResources.color000000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringResource.radio),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomTask()));
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lightbulb_outline,
                size: 100,
                color: bulbColor,
              ),
              Container(
                width: 150,
                child: Row(
                  children: [
                    Radio(
                      value: Colors.red,
                      groupValue: bulbColor,
                      onChanged: (val) {
                        bulbColor = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      StringResource.red,
                      style: TextStyle(
                        fontSize: FontSize.twentyfour,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                child: Row(
                  children: [
                    Radio(
                      value: Colors.green,
                      groupValue: bulbColor,
                      onChanged: (val) {
                        bulbColor = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      StringResource.green,
                      style: TextStyle(
                        fontSize: FontSize.twentyfour,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                child: Row(
                  children: [
                    Radio(
                      value: Colors.blue,
                      groupValue: bulbColor,
                      onChanged: (val) {
                        bulbColor = val;
                        setState(() {});
                      },
                    ),
                    Text(
                      StringResource.blue,
                      style: TextStyle(
                        fontSize: FontSize.twentyfour,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

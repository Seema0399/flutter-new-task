import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/custom_widgets_screen/radio_button.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class SwitchCheckbox extends StatefulWidget {
  @override
  _SwitchCheckboxState createState() => _SwitchCheckboxState();
}

class _SwitchCheckboxState extends State<SwitchCheckbox> {
  bool _isChecked = false;
  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringResource.check),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RadioButton()));
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (bool value) {
                  onChanged(value);
                },
              ),
              Switch(
                value: _isChecked,
                onChanged: (bool value) {
                  onChanged(value);
                },
              ),
            ],
          ),
        ));
  }
}

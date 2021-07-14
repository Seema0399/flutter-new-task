import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/custom_widgets_screen/radio_button.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class SwitchCheckbox extends StatefulWidget {
  @override
  _SwitchCheckboxState createState() => _SwitchCheckboxState();
}

class _SwitchCheckboxState extends State<SwitchCheckbox> {
  final allChecked = CheckBoxModel(title: 'All Checked');
  final checkBoxList = [
    CheckBoxModel(title: 'CheckBox 1'),
    CheckBoxModel(title: 'CheckBox 2'),
    CheckBoxModel(title: 'CheckBox 3'),
    CheckBoxModel(title: 'CheckBox 4'),
  ];

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
      body: ListView(
        children: [
          ListTile(
            onTap: () => onAllClicked(allChecked),
            leading: Checkbox(
              value: allChecked.value,
              onChanged: (value) => onAllClicked(allChecked),
            ),
            title: Text(
              allChecked.title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
          ),
          Divider(),
          ...checkBoxList
              .map(
                (item) => ListTile(
                  onTap: () => onItemClicked(item),
                  leading: Checkbox(
                    value: item.value,
                    onChanged: (value) => onItemClicked(item),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  onAllClicked(CheckBoxModel ckbitem) {
    final newValue = !ckbitem.value;
    setState(() {
      ckbitem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemClicked(CheckBoxModel ckbitem) {
    final newValue = !ckbitem.value;
    setState(() {
      ckbitem.value = newValue;
      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModel {
  String title;
  bool value;
  CheckBoxModel({@required this.title, this.value = false});
}

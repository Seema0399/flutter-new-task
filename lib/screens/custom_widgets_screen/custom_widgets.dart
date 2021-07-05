import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/custom_widgets_screen/switch_checkbox.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

class CustomWidget extends StatefulWidget {
  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  _CustomWidgetState({this.title});
  final String title;

  TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(StringResource.dialog),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                color: ColorResources.colorE91E63,
                textColor: ColorResources.colorFFFFFF,
                child: Text(StringResource.cancel),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                color: ColorResources.color4CAF50,
                textColor: ColorResources.colorFFFFFF,
                child: Text(StringResource.ok),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  String codeDialog;
  String valueText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (codeDialog == "123456")
          ? ColorResources.color4CAF50
          : ColorResources.colorFFFFFF,
      appBar: AppBar(
        backgroundColor: ColorResources.color009688,
        title: Text(StringResource.alertdialog),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          color: ColorResources.color9C27B0,
          textColor: ColorResources.colorFFFFFF,
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: Text(StringResource.pressalert),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SwitchCheckbox()));
            },
            tooltip: 'Click',
            heroTag: 'NextScreen',
            child: Text(StringResource.click),
          ),
        ],
      ),
    );
  }
}

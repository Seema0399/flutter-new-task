import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_task_new/screens/horizontal_vertical_screen/horizontal.dart';
import 'package:flutter_task_new/utils/image_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class LoginValidation extends StatefulWidget {
  @override
  _LoginValidationState createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {
  String email, phone;
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  InputDecoration buildInputDecoration(IconData icons, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      hintStyle: TextStyle(
        fontFamily: 'Poppins',
      ),
      prefixIcon: Icon(icons),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image(image: AssetImage(ImageResource.flutter)),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.email, "Email"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: buildInputDecoration(Icons.phone, 'Mobile No'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Mobile No ';
                    }

                    return null;
                  },
                  onSaved: (String value) {
                    phone = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.lock, 'Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Password';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    StringResource.login,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState.validate())
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Horizontal()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

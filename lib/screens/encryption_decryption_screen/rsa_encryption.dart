import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:flutter_task_new/screens/animation_screen/animation.dart';
import 'package:flutter_task_new/utils/color_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class Rsaencryption extends StatefulWidget {
  @override
  _RsaencryptionState createState() => _RsaencryptionState();
}

class _RsaencryptionState extends State<Rsaencryption> {
  TextEditingController pass = TextEditingController();

  var key = "null";
  String encryptedS, decryptedS;

  var password = "null";

  PlatformStringCryptor cryptor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.password,
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
                  MaterialPageRoute(builder: (context) => AnimationFlutter()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: ColorResources.color000000),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: ColorResources.colorEF5350),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue[400])),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                ),
                cursorColor: ColorResources.colorFFFFFF,
              ),
            ),
            TextButton(
              onPressed: () {
                encrypt();
              },
              child: Text(StringResource.encryption),
            ),
            TextButton(
              onPressed: () {
                decrypt();
              },
              child: Text(StringResource.decryption),
            ),
          ],
        ),
      ),
    );
  }

  void encrypt() async {
    cryptor = PlatformStringCryptor();
    final salt = await cryptor.generateSalt();

    password = pass.text;

    key = await cryptor.generateKeyFromPassword(password, salt);

    encryptedS = await cryptor.encrypt(password, key);

    print(encryptedS);
  }

  void decrypt() async {
    try {
      decryptedS = await cryptor.decrypt(encryptedS, key);

      print(decryptedS);
    } on MacMismatchException {}
  }
}

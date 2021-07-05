import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/encryption_decryption_screen/aes_encryption_decryption.dart';
import 'package:flutter_task_new/screens/encryption_decryption_screen/rsa_encryption.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class Encryption extends StatefulWidget {
  @override
  _EncryptionState createState() => _EncryptionState();
}

class _EncryptionState extends State<Encryption> {
  TextEditingController _textFieldController = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.encrypt,
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
                  MaterialPageRoute(builder: (context) => Rsaencryption()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _textFieldController,
              ),
            ),
            Column(
              children: [
                Text(
                  StringResource.plaintext,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeights.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(plainText == null ? '' : plainText),
                ),
              ],
            ),
            Column(children: <Widget>[
              Text(StringResource.encryptedtext,
                  style: TextStyle(
                    fontSize: FontSize.twentyfive,
                    color: Colors.blue,
                    fontWeight: FontWeights.normal,
                  )),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(encryptedText == null
                    ? ''
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64
                        : encryptedText),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    plainText = _textFieldController.text;
                    setState(() {
                      encryptedText =
                          AesEncryptionDecryption.encryptAES(plainText);
                    });
                  },
                  child: Text(StringResource.encryption),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      encryptedText =
                          AesEncryptionDecryption.decryptAES(encryptedText);
                    });
                  },
                  child: Text(StringResource.decryption),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

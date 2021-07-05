import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/encryption_decryption_screen/encryption.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class ThemesColor extends StatefulWidget {
  @override
  _ThemesColorState createState() => _ThemesColorState();
}

class _ThemesColorState extends State<ThemesColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.themes,
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
                  MaterialPageRoute(builder: (context) => Encryption()));
            },
          )
        ],
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: Text(
          StringResource.message,
          style: TextStyle(
            fontSize: FontSize.twenty,
            fontWeight: FontWeights.normal,
            letterSpacing: 2,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}

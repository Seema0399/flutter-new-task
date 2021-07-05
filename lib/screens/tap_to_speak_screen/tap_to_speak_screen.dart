import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/currency_formatter_screen/currency_formatter_screen.dart';

import 'package:flutter_tts/flutter_tts.dart';

class TapToSpeak extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    _speak(String text) async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      print(await flutterTts.getVoices);
      await flutterTts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tap to speak',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CurrencyFormatter()));
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textEditingController,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("press this button to say hello"),
              onPressed: () => _speak(textEditingController.text),
            ),
          ],
        ),
      ),
    );
  }
}

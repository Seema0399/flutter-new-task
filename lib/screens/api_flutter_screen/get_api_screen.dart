import 'package:flutter/material.dart';

class GetApi extends StatefulWidget {
  @override
  _GetApiState createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(
          'API',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

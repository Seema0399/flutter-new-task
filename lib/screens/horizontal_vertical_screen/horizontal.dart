import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/movie_detail_screen/movie_detail_list.dart';
import 'package:flutter_task_new/utils/image_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            StringResource.horizontal,
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
                      MaterialPageRoute(builder: (context) => ListDetail()));
                }),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      (ImageResource.pink),
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageResource.purple),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageResource.rose),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageResource.sunflower),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                height: 480.0,
                width: 240.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageResource.white),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ],
          ),
        ));
  }
}

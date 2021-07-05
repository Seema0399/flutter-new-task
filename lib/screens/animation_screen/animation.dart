import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/animation_screen/lottie_view_animation.dart';
import 'package:flutter_task_new/utils/color_resources.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimationFlutter extends StatefulWidget {
  @override
  _AnimationFlutterState createState() => _AnimationFlutterState();
}

class _AnimationFlutterState extends State<AnimationFlutter>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Tween _tween;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _tween = new Tween<double>(begin: 150, end: 480);

    _animation = _tween.animate(_controller);
    _animation.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation',
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
                  MaterialPageRoute(builder: (context) => LottieView()));
            },
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: _animation.value,
              left: 50,
              child: ScaleTransition(
                scale: _controller,
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: ColorResources.colorFFC107,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: _animation.value,
              left: 100,
              child: ScaleTransition(
                scale: _controller,
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: ColorResources.color9C27B0,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: _animation.value,
              left: 150,
              child: ScaleTransition(
                scale: _controller,
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: ColorResources.colorFFEB3B,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: _animation.value,
              left: 200,
              child: ScaleTransition(
                scale: _controller,
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: ColorResources.colorEF5350,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: _animation.value,
              left: 250,
              child: ScaleTransition(
                scale: _controller,
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: ColorResources.colorE91E63,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: _animation.value,
              left: 300,
              child: ScaleTransition(
                scale: _controller,
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: ColorResources.color4CAF50,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

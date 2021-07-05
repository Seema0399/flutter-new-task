import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/tabbar_screen/bottom_tabs.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class TaskBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              StringResource.tabbar,
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
                      MaterialPageRoute(builder: (context) => BottomTabs()));
                },
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: ChoicePage(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'CAR', icon: Icons.directions_car),
  Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'TRAIN', icon: Icons.directions_railway),
  Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150,
              color: textStyle.color,
            ),
          ],
        ),
      ),
    );
  }
}

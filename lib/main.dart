import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/biometric_screen/biometric_screen.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: Locales.delegates,
      // supportedLocales: Locales.supportedLocales,
      // locale: locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        primaryColor: ColorResources.color90CAF9,
        accentColor: ColorResources.color90CAF9,
      ),

      home: Biometric(),
    );
  }
}

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyApp1State createState() => _MyApp1State();
// }

// class _MyApp1State extends State<MyApp1> {
//   Locale locale;
//   changeLanguage(Locale locale) {
//     setState(() {
//       locale = locale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       supportedLocales: context.supportedLocales,
//       localizationsDelegates: context.localizationDelegates,
//       locale: locale,
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:flutter_task_new/screens/biometric_screen/biometric_screen.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

// void main() {
//   runApp(EasyLocalization(
//     child: MyApp(),
//     path: "assets/langs",
//     supportedLocales: [
//       Locale('en', 'US'),
//       Locale('ar', 'AE'),
//     ],
//   ));
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorResources.color90CAF9,
        accentColor: ColorResources.color90CAF9,
      ),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      home: Biometric(),
    );
  }
}

// class LocalisationEng extends StatefulWidget {
//   @override
//   _LocalisationEngState createState() => _LocalisationEngState();
// }

// class _LocalisationEngState extends State<LocalisationEng> {
//   Locale _locale;
//   changeLanguage(Locale locale) {
//     setState(() {
//       _locale = locale;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Localisation').tr(),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.arrow_forward_ios_outlined),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Biometric()));
//               },
//             )
//           ],
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               'Hello'.tr().toString(),
//               style: TextStyle(
//                 fontSize: 30,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // ignore: deprecated_member_use
//                 RaisedButton(
//                   onPressed: () {
//                     setState(() {
//                       EasyLocalization.of(context)
//                           .setLocale(Locale('en', 'US'));
//                     });
//                   },
//                   child: Text('English'),
//                 ),
//                 // ignore: deprecated_member_use
//                 RaisedButton(
//                   onPressed: () {
//                     setState(() {
//                       EasyLocalization.of(context)
//                           .setLocale(Locale('ar', 'AE'));
//                     });
//                   },
//                   child: Text('Arabic'),
//                 )
//               ],
//             )
//           ],
//         ));
//   }
// }

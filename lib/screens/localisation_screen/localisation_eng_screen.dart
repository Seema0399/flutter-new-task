import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalisationEng extends StatefulWidget {
  @override
  _LocalisationEngState createState() => _LocalisationEngState();
}

class _LocalisationEngState extends State<LocalisationEng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Localisation').tr(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello").tr(),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  EasyLocalization.of(context).setLocale(Locale('en', 'US'));
                  // // setState(() {});
                  // MyApp1.setLocale(context, Locale('en', 'US'));
                },
                child: Text('English'),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  EasyLocalization.of(context).setLocale(Locale('ar', 'AE'));
                  // setState((){});
                  //   MyApp1.setLocale(context, Locale('ar', 'AE'));
                },
                child: Text('Arabic'),
              ),
            ],
          ),
        ));
  }
}


// class LocalisationEng extends StatefulWidget {
//   @override
//   _LocalisationEngState createState() => _LocalisationEngState();
// }

// class _LocalisationEngState extends State<LocalisationEng> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(StringResource.localisation),
//       ),
//       body: Container(
//         child: Center(
//           child: LocaleText(
//             StringResource.welcome,
//             style: TextStyle(
//               fontSize: FontSize.thirty,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.language_outlined),
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (_) => LanguagePage()));
//         },
//       ),
//     );
//   }
// }

// class LanguagePage extends StatefulWidget {
//   @override
//   _LanguagePageState createState() => _LanguagePageState();
// }

// class _LanguagePageState extends State<LanguagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(StringResource.language),
//       ),
//       body: Column(
//         children: <Widget>[
//           ListTile(
//             title: Text(StringResource.english),
//             onTap: () => LocaleNotifier.of(context).change('en'),
//           ),
//           ListTile(
//             title: Text(StringResource.tamil),
//             onTap: () => LocaleNotifier.of(context).change('ta'),
//           ),
//           ListTile(
//             title: Text(StringResource.arabic),
//             onTap: () => LocaleNotifier.of(context).change('ar'),
//           ),
//         ],
//       ),
//     );
//   }
// }

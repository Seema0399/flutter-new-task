import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/login_validation_screen/login_validation.dart';
import 'package:flutter_task_new/utils/color_resources.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/image_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class Biometric extends StatefulWidget {
  @override
  _BiometricState createState() => _BiometricState();
}

class _BiometricState extends State<Biometric> {
  LocalAuthentication auth = LocalAuthentication();

  bool _canCheckBiometric;
  List<BiometricType> availableBiometrics;
  String autherized = "Not autherized";

  Future<void> _checkBiometric() async {
    bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    List<BiometricType> _availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Scan Your Fingerprint to autheticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted)
      return setState(() {
        autherized =
            authenticated ? "Authorized Success" : "Failed to Authenticate";
        if (authenticated) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginValidation()));
        }

        print(autherized);
      });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.colorFFFFFF,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  StringResource.login,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeights.bold,
                    fontSize: 48,
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(ImageResource.fingerprint),
                      width: 120,
                    ),
                    Text(
                      'Fingerprint Authetication',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: FontSize.twentytwo,
                        fontWeight: FontWeights.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          'Aunthentication',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        onPressed: () {
                          _authenticate();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          StringResource.login,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginValidation()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

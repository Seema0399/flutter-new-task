import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/youtube_player_screen/youtube_player_screen.dart';

import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:flutter_task_new/utils/image_resources.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

class CurrencyFormatter extends StatefulWidget {
  @override
  _CurrencyFormatterState createState() => _CurrencyFormatterState();
}

class _CurrencyFormatterState extends State<CurrencyFormatter> {
  TextEditingController _textFieldController = TextEditingController();

  String _selectedCurrency;
  String dollarValue = "";

  String selectedValue;
  bool isdropDownSelected = false;
  List<String> currenciesList = ['USD', 'AUD', 'SGD', 'NZD', 'EUR'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff1c1d22),
          title: Text(
            StringResource.exchange,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorResources.colorFFFFFF,
              fontWeight: FontWeights.normal,
              fontSize: FontSize.twelve,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              color: ColorResources.colorFFFFFF,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPage()));
              },
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(children: [
            Container(
              child: Image(
                image: AssetImage(ImageResource.bg),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(15),
                  color: ColorResources.colorFFFFFF,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringResource.money,
                            style: TextStyle(
                              color: Color(0xff1c1d22),
                              fontWeight: FontWeights.bold,
                              fontSize: FontSize.sixteen,
                              fontFamily: 'Poppins',
                              letterSpacing: 0,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 120, bottom: 20),
                                child: Container(
                                  width: 200,
                                  child: Text(
                                    StringResource.realtime,
                                    style: TextStyle(
                                      color: Color(0xff9d9da9),
                                      fontFamily: 'Poppins',
                                      fontSize: FontSize.ten,
                                      fontWeight: FontWeights.normal,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0xffb9b9bf),
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: DropdownButton(
                                iconSize: 30,
                                iconEnabledColor: Color(0xff0066cc),
                                value: _selectedCurrency,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCurrency = newValue;
                                    selectedValue = newValue;
                                    isdropDownSelected = true;
                                  });
                                },
                                items: currenciesList.map(
                                  (valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  },
                                ).toList(),
                                hint: Text(
                                  'USD',
                                  style: TextStyle(
                                    color: ColorResources.color000000,
                                    fontSize: 30,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 120, right: 20, top: 6),
                              child: Container(
                                width: 100,
                                child: TextField(
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 30,
                                      color: Color(0xff1c1d22),
                                    ),
                                    textAlign: TextAlign.right,
                                    enabled: isdropDownSelected,
                                    controller: _textFieldController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          fontSize: FontSize.thirty,
                                          fontFamily: 'Poppins',
                                          color: Color(0xff1c1d22),
                                        ),
                                        contentPadding: EdgeInsets.all(5),
                                        fillColor: ColorResources.colorFFFFFF,
                                        filled: true)),
                              ),
                            ),
                          ]),
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Divider(
                                  color: Color(0xffb9b9bf),
                                  indent: 1,
                                ),
                                ListTile(
                                  title: Chip(
                                    label: Text(
                                      '1=72',
                                      style: TextStyle(
                                        color: Color(0xff616267),
                                        fontSize: FontSize.ten,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  StringResource.inr,
                                  style: TextStyle(
                                    fontSize: FontSize.thirty,
                                    fontFamily: 'Poppins',
                                    color: ColorResources.color000000,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 145, right: 20, top: 6),
                                child: Container(
                                  width: 100,
                                  height: 72,
                                  child: Text(dollarValue,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 30,
                                        color: Color(0xff1c1d22),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Color(0xffb9b9bf),
                          ),
                          ListTile(
                            leading: Padding(
                              padding: EdgeInsets.only(bottom: 20, right: 135),
                              child: ElevatedButton(
                                child: Text(
                                  StringResource.exchangenow,
                                  style: TextStyle(
                                    fontSize: FontSize.twelve,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    dollarValue = getDollarValue(
                                        _textFieldController.text);
                                  });
                                },
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        )));
  }

  String getDollarValue(value) {
    double typedValue = double.parse(value);
    if (_selectedCurrency == 'USD') {
      typedValue = typedValue * 72;
    } else if (_selectedCurrency == 'AUD') {
      typedValue = typedValue * 56;
    } else if (_selectedCurrency == 'NZD') {
      typedValue = typedValue * 51.58;
    } else if (_selectedCurrency == 'SGD') {
      typedValue = typedValue * 55.13;
    } else if (_selectedCurrency == 'EUR') {
      typedValue = typedValue * 88.06;
    }
    return (typedValue).toString();
  }
}

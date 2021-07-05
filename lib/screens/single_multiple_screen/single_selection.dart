import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  List<String> sortFilter;
  SingleSelection(this.sortFilter);

  @override
  _SingleSelectionState createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  String selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.sortFilter.first;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
            child: Row(
          children: <Widget>[
            Radio(
                value: widget.sortFilter[index],
                groupValue: selectedValue,
                onChanged: (s) {
                  selectedValue = s;
                  setState(() {});
                }),
            Text(widget.sortFilter[index]),
          ],
        ));
      },
      itemCount: widget.sortFilter.length,
    );
  }
}

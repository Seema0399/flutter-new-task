import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/single_multiple_screen/contact_model.dart';
import 'package:flutter_task_new/screens/url_screen/load_url.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/string_resources.dart';

class MultipleSelection extends StatefulWidget {
  @override
  _MultipleSelectionState createState() => _MultipleSelectionState();
}

class _MultipleSelectionState extends State<MultipleSelection> {
  List<ContactModel> contacts = [
    ContactModel('Apple', '9987654321', false),
    ContactModel('Mango', '9987654532', false),
    ContactModel('Grapes', '9956454321', false),
    ContactModel('Cadberry', '9887654021', false),
    ContactModel('Dairy milk', '9985645321', false),
    ContactModel('Milkybar', '9913456789', false),
    ContactModel('Fivestar', '9983215678', false),
    ContactModel('Eclairs', '9987672134', false),
    ContactModel('Lays', '9990564321', false),
    ContactModel('Orange', '9783213456', false),
    ContactModel('Strawberry', '9566190788', false),
  ];

  // ignore: deprecated_member_use
  List<ContactModel> selectedContacts = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.multiple,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return contactItem(
                          contacts[index].name,
                          contacts[index].phonenumber,
                          contacts[index].isSelected,
                          index);
                    }),
              ),
              selectedContacts.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.green[700],
                          child: Text(
                            'Click',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.eighteen,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoadUrl()));
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactItem(
      String name, String phonenumber, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeights.normal,
        ),
      ),
      subtitle: Text('phoneNumber'),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            selectedContacts.add(ContactModel(name, phonenumber, isSelected));
          } else if (contacts[index].isSelected == false) {
            selectedContacts
                .removeWhere((element) => element.name == contacts[index].name);
          }
        });
      },
    );
  }
}

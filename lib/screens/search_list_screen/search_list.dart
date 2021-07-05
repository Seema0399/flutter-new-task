import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/single_multiple_screen/single_multiple.dart';
import 'package:flutter_task_new/utils/image_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'search_page.dart';
import 'package:search_page/search_page.dart';

class SearchList extends StatelessWidget {
  static List<Contact> contact = [
    Contact(name: 'Apple', mobilenumber: '9987654321', time: '6.30'),
    Contact(name: 'Mango', mobilenumber: '9987654532', time: '7.30'),
    Contact(name: 'Grapes', mobilenumber: '9956454321', time: '9.30'),
    Contact(name: 'Cadberry', mobilenumber: '9887654021', time: '8.30'),
    Contact(name: 'Dairy milk', mobilenumber: '9985645321', time: '4.30'),
    Contact(name: 'Milkybar', mobilenumber: '9913456789', time: '3.30'),
    Contact(name: 'Fivestar', mobilenumber: '9983215678', time: '12.30'),
    Contact(name: 'Eclairs', mobilenumber: '9987672134', time: '11.30'),
    Contact(name: 'Lays', mobilenumber: '9990564321', time: '2.30'),
    Contact(name: 'Orange', mobilenumber: '9783213456', time: '8.30'),
    Contact(name: 'Strawberry', mobilenumber: '9566190788', time: '4.30'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.searches),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Contact>(
                    searchLabel: 'Search Contact',
                    suggestion: Center(
                      child: Container(
                        height: 400,
                        width: 350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(ImageResource.contacts),
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                    builder: (contact) => ListTile(
                          title: Text(contact.name),
                          subtitle: Text(contact.mobilenumber),
                          trailing: Text(contact.time),
                        ),
                    filter: (contact) => [
                          contact.name,
                          contact.mobilenumber,
                          contact.time,
                        ],
                    items: contact,
                    failure: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImageResource.search),
                                fit: BoxFit.cover)),
                      ),
                    ))),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contact.length,
          itemBuilder: (context, index) {
            final Contact contacts = contact[index];
            return ListTile(
                title: Text(contacts.name),
                subtitle: Text(contacts.mobilenumber),
                trailing: Text(contacts.time),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleMultiple()));
                });
          }),
    );
  }
}

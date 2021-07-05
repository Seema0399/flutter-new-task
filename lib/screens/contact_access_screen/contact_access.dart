import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:flutter_task_new/screens/generic_class_screen/themes_color.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_task_new/utils/color_resources.dart';

class ContactAccess extends StatefulWidget {
  @override
  _ContactAccessState createState() => _ContactAccessState();
}

class _ContactAccessState extends State<ContactAccess> {
  List<Contact> listContacts;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    listContacts = new List();
    readContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.contactlist,
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
                  MaterialPageRoute(builder: (context) => ThemesColor()));
            },
          ),
        ],
      ),
      body: Container(
        child: (listContacts.length > 0)
            ? ListView.builder(
                itemCount: listContacts.length,
                itemBuilder: (context, index) {
                  Contact contact = listContacts.get(index);
                  return Card(
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: ColorResources.color4CAF50,
                          child: Center(
                            child: (contact.avatar != null)
                                ? Image.memory(
                                    contact.avatar,
                                    height: 28,
                                    width: 28,
                                  )
                                : Icon(Icons.face),
                          ),
                        ),
                        title: Text("${contact.displayName}"),
                        subtitle: Text((contact.phones.length > 0)
                            ? "${contact.phones.get(0)}"
                            : "No contact"),
                        trailing: InkWell(
                          child: Icon(
                            Icons.call,
                            color: ColorResources.color4CAF50,
                          ),
                          onTap: () {
                            _makePhoneCall(
                                "tel:${contact.phones.length.gcd(0)}");
                          },
                        )),
                  );
                })
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: ColorResources.colorE91E63,
                    ),
                    Text(StringResource.readingcontacts),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  readContacts() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Contacts.streamContacts().forEach((contact) {
        print("${contact.displayName}");
        setState(() {
          listContacts.add(contact);
        });
      });
    }

    // You can manually adjust the buffer size
    //return  Contacts.streamContacts(bufferSize: 10);
  }

  //Check contacts permission
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus;
    } else {
      return permission;
    }
  }
}
// class ContactAddress extends StatefulWidget {
//   @override
//   _ContactAddressState createState() => _ContactAddressState();
// }
//
// class _ContactAddressState extends State<ContactAddress> {
//   List<Contact> contacts = [];
//   List<Contact> contactsFiltered = [];
//   Map<String, Color> contactsColorMap = new Map();
//   TextEditingController searchController = new TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     getAllContacts();
//     searchController.addListener(() {
//       filterContacts();
//     });
//   }

//   String flattenPhoneNumber(String phoneStr) {
//     return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
//       return m[0] == "+" ? "+" : "";
//     });
//   }

//   getAllContacts() async {
//     List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.orange];
//     int colorIndex = 0;
//     List<Contact> _contacts = (await ContactsService.getContacts()).toList();
//     _contacts.forEach((contact) {
//       Color baseColor = colors[colorIndex];
//       contactsColorMap[contact.displayName] = baseColor;
//       colorIndex++;
//       if (colorIndex == colors.length) {
//         colorIndex = 0;
//       }
//     });
//     setState(() {
//       contacts = _contacts;
//     });
//   }

//   filterContacts() {
//     List<Contact> _contacts = [];
//     _contacts.addAll(contacts);
//     if (searchController.text.isNotEmpty) {
//       _contacts.retainWhere((contact) {
//         String searchTerm = searchController.text.toLowerCase();
//         String contactName = contact.displayName.toLowerCase();
//         String searchTermFlatten = flattenPhoneNumber(searchTerm);

//         bool nameMatches = contactName.contains(searchTerm);
//         if (nameMatches == true) {
//           return true;
//         }
//         if (searchTermFlatten.isEmpty) {
//           return false;
//         }
//         var phone = contact.phones.firstWhere((phn) {
//           String phnFlattened = flattenPhoneNumber(phn.value);
//           return phnFlattened.contains(searchTermFlatten);
//         }, orElse: () => null);
//         return phone != null;
//       });
//     }
//     setState(() {
//       contactsFiltered = _contacts;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isSearching = searchController.text.isNotEmpty;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contacts'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: <Widget>[
//             Container(
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   labelText: 'Search',
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                     color: Theme.of(context).primaryColor,
//                   )),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: isSearching == true
//                       ? contactsFiltered.length
//                       : contacts.length,
//                   itemBuilder: (context, index) {
//                     Contact contact = isSearching == true
//                         ? contactsFiltered[index]
//                         : contacts[index];
//                     return ListTile(
//                         title: Text(contact.displayName),
//                         subtitle: Text(
//                           contact.phones.elementAt(0).value,
//                         ),
//                         leading: (contact.avatar != null &&
//                                 contact.avatar.length > 0)
//                             ? CircleAvatar(
//                                 backgroundImage: MemoryImage(contact.avatar),
//                               )
//                             : CircleAvatar(
//                                 child: Text(contact.initials()),
//                               ));
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

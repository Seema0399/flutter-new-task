import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_task_new/utils/font.dart';
import 'package:flutter_task_new/utils/image_resources.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as lct;
import 'package:flutter_task_new/screens/tabbar_screen/tab_bar.dart';

class GooogleMap extends StatefulWidget {
  @override
  _GooogleMapState createState() => _GooogleMapState();
}

const DEFAULT_LOCATION = LatLng(37.3304, -121.8807);

class _GooogleMapState extends State<GooogleMap> {
  LatLng currentLocation = DEFAULT_LOCATION;
  Completer<GoogleMapController> _mapController = Completer();
  String finalLat = '';
  String finalLong = '';
  bool buscando = false;
  lct.Location location;
  @override
  void initState() {
    requestPerms();
    super.initState();
  }

// permission
  requestPerms() async {
    Map<Permission, PermissionStatus> statues =
        await [Permission.locationAlways].request();

    var status = statues[Permission.locationAlways];
    if (status == PermissionStatus.denied) {
      requestPerms();
    } else {
      gpsAnable();
    }
  }

// GPS
  gpsAnable() async {
    location = lct.Location();
    bool statusResult = await location.requestService();
    if (!statusResult) {
      gpsAnable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 15,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onCameraMove: (CameraPosition camerapos) {
              buscando = false;
              setState(() {});
              finalLat = camerapos.target.latitude.toString();
              finalLong = camerapos.target.longitude.toString();
            },
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
            onCameraIdle: () {
              buscando = true;
              setState(() {});
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(ImageResource.pinlocation),
              height: 122,
            ),
          ),
          buscando == true
              ? Positioned(
                  top: MediaQuery.of(context).size.height / 3.58,
                  bottom: MediaQuery.of(context).size.width / 3.5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.75),
                    ),
                    width: 180,
                    height: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lat $finalLat',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Long $finalLong',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ))
              : Positioned(
                  top: MediaQuery.of(context).size.height / 3.58,
                  bottom: MediaQuery.of(context).size.width / 3.5,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 17),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.75),
                      ),
                      width: 50,
                      height: 40,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                          strokeWidth: 2.5,
                        ),
                      )),
                ),
          DraggableScrollableSheet(
            builder: (context, controller) {
              return Container(
                child: ListView(
                  controller: controller,
                  children: [
                    Divider(
                      height: 15,
                      thickness: 4,
                      color: Colors.grey[400],
                      indent: 185,
                      endIndent: 185,
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        enabled: false,
                        onTap: () {},
                        decoration: InputDecoration.collapsed(
                            hintText: " Where do you want to go?",
                            hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.indigo[300],
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    DirecListTile('Home', (Icons.home)),
                    DirecListTile('Work', (Icons.work)),
                    DirecListTile('Click', (Icons.add)),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white),
              );
            },
          ),
        ],
      ),
    ));
  }
}

class DirecListTile extends StatelessWidget {
  final String head;
  final IconData icon;

  DirecListTile(this.head, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(9.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    child: Icon(
                      icon,
                      color: Colors.deepPurple,
                      size: 18,
                    ),
                    radius: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          head,
                          style: TextStyle(
                              fontSize: FontSize.sixteen,
                              fontWeight: FontWeights.normal),
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        Text(
                          StringResource.favorite,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                              fontWeight: FontWeights.normal),
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        Text(
                          StringResource.press,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: FontSize.fourteen,
                              fontWeight: FontWeights.normal),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TaskBar()));
        },
      ),
    );
  }
}

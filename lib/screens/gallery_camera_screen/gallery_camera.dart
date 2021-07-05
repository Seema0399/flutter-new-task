import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_task_new/screens/custom_widgets_screen/custom_widgets.dart';
import 'package:flutter_task_new/utils/string_resources.dart';
import 'package:image_picker/image_picker.dart';

class GalleryCamera extends StatefulWidget {
  @override
  _GalleryCameraState createState() => _GalleryCameraState();
}

class _GalleryCameraState extends State<GalleryCamera> {
  PickedFile imageURI;
  final ImagePicker _picker = ImagePicker();

  Future getImageFromGalleryCamera(bool isCamera) async {
    var image = await _picker.getImage(
        source: (isCamera == true) ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      imageURI = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringResource.photo,
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
                  MaterialPageRoute(builder: (context) => CustomWidget()));
            },
          ),
        ],
      ),
      body: Container(
        child: imageURI == null
            ? Text(StringResource.image)
            : Image.file(File(imageURI.path)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              getImageFromGalleryCamera(true);
            },
            tooltip: 'Click',
            heroTag: 'Camera',
            child: Icon(
              Icons.camera,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              getImageFromGalleryCamera(false);
            },
            tooltip: 'Click',
            heroTag: 'Gallery',
            child: Icon(
              Icons.photo_album,
            ),
          ),
        ],
      ),
    );
  }
}

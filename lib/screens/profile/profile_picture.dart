import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webshop/screens/profile/take_profile_picture.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File image;

  @override
  void initState() {
    super.initState();
    initImage();
  }

  Future<void> initImage() async {
    final path = join(
      (await getApplicationDocumentsDirectory()).path,
      'profilePicture.png',
    );
    final file = File(path);
    if (file.existsSync()) {
      setState(() {
        image = file;
      });
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(image?.path);
    return Stack(
      children: <Widget>[
        Container(
          child: CircleAvatar(
            radius: 105,
            backgroundColor: Colors.deepPurple,
            child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: image?.existsSync() == true
                    ? Image.memory(
                  image.readAsBytesSync(),
                  fit: BoxFit.fill,
                ).image
                    : null,
                child: image?.existsSync() != true
                    ? Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Colors.black,
                )
                    : null
            ),
             ),
        ),
        Positioned(
          child: GestureDetector(
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
            onTap: () async {
              File newImage = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TakeProfilePictureScreen(),
                ),
              );
              setImage(newImage);
            },
          ),
          right: 0,
          bottom: 0,
        ),
      ],
    );
  }
}

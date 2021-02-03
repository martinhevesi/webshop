import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webshop/camera_manager.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:provider/provider.dart';

class TakeProfilePictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var camera = context.watch<CameraDescription>();
    return TakeProfilePicture(camera: camera);
  }
}

class TakeProfilePicture extends StatefulWidget {
  final CameraDescription camera;

  TakeProfilePicture({
    Key key,
    this.camera,
  }) : super(key: key);

  @override
  _TakeProfilePictureState createState() => _TakeProfilePictureState();
}

class _TakeProfilePictureState extends State<TakeProfilePicture> {
  Future<void> _initializeControllerFuture;
  CameraManager cameraManager;

  void initState() {
    super.initState();

    cameraManager = CameraManager(camera: widget.camera);

    _initializeControllerFuture = cameraManager.initialize();
  }

  @override
  void dispose() {
    cameraManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WebshopLocalizations.of(context).takeAPicture, style: TextStyle(fontFamily: "Raleway"),),
        backgroundColor: Colors.grey[900],
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(cameraManager.cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final path = join(
              (await getApplicationDocumentsDirectory()).path,
              'profilePicture.png',
            );

            final file = File(path);
            if (file.existsSync()) {
              file.deleteSync();
            }

            await cameraManager.cameraController.takePicture(path);
            Navigator.pop(context, file);
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

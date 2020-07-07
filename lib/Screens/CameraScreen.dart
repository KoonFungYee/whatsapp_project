import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/Screens/SplashScreen.dart';
import 'package:whatsapp_project/main.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController;
  bool ready;

  @override
  void initState() {
    print(camera.length);
    _cameraController = CameraController(camera[0], ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          ready = true;
        });
      }
    });
    super.initState();
    ready = false;
  }

  Future<void> checkAvailableCamera() async {
    
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized || ready == false) {
      return new Center(child: new Container());
    } else {
      return new Scaffold(
        body: new Container(
          // aspectRatio: _cameraController.value.aspectRatio,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              CameraPreview(_cameraController),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {},
                    child: Text("data"),
                    color: Colors.blue,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project/Screens/Login.dart';

List<CameraDescription> camera;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    check();
    Timer(Duration(milliseconds: 800), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    });
    super.initState();
  }

  Future<void> check() async {
    camera = await availableCameras() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child:
                Image(image: AssetImage('assets/images/WhatsApp_Logo_4.png')),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:nammameet/room.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: Room(),
        title: new Text('Namma:\n\t\t Meet',style: TextStyle(color: Colors.white,fontSize: 60,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        loaderColor: Colors.white,

      ),
    );
  }
}
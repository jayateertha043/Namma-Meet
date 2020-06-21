import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nammameet/room.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Room())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Namma\n\t\t Meet',style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.bold),)),
            Padding(
              padding: const EdgeInsets.only(bottom:150),
              child: Align(alignment: Alignment.bottomCenter,child: CircularProgressIndicator()),
            )
          ],
        ),
    );
  }
}
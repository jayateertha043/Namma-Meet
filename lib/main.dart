import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nammameet/splash.dart';
//-keep class com.google.firebase.** { *; }
void main(){
  
      runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            title: 'Namma Meet',
      darkTheme: ThemeData.dark(
        
      ) ,
      theme: ThemeData(
        canvasColor: Colors.purple[100],
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
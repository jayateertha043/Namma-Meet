import 'dart:async';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:nammameet/room.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool nav = true;
  final PLAY_STORE_URL =
      'https://play.google.com/store/apps/details?id=com.japps.nammameet';

  versionCheck(context) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion =
        double.parse(info.version.trim().replaceAll(".", ""));

    //Get Latest version info from firebase config
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      remoteConfig.getString('force_update_current_version');
      double newVersion = double.parse(remoteConfig
          .getString('force_update_current_version')
          .trim()
          .replaceAll(".", ""));
      if (newVersion > currentVersion) {
        setState(() {
          nav = false;
        });
        _showVersionDialog(context);
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

  _showVersionDialog(context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Version Available";
        String message =
            "There is a newer version of app available please update it now for a smooth and secure experience.";
        String btnLabel = "Update Now";
        return WillPopScope(
          onWillPop: (){exit(0);},
                  child: new AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text(btnLabel),
                onPressed: () => launch(PLAY_STORE_URL),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    try {
      versionCheck(context).then((_){
            if (nav == true) {
      print(nav);
      Timer(
          Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Room())));
    }
      });
    } catch (e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Stack(
    //mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
          child: Text(
        'Namma\n\t\t Meet',
        style: TextStyle(
            color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
      )),
      Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator()),
      )
    ],
        ),
      );
  }
}

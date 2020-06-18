import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/jitsi_meeting_listener.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  final roomText = TextEditingController();
  final subjectText = TextEditingController();
  final nameText = TextEditingController();
  final emailText = TextEditingController();
  var isAudioOnly = true;
  var isAudioMuted = true;
  var isVideoMuted = true;
  double dheight, dwidth;
  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    dheight = MediaQuery.of(context).size.height;
    dwidth = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 35,bottom: 100),
        child: Align(alignment: Alignment.bottomCenter,child: FloatingActionButton(onPressed: (){
          Share.share("Namma: Meet India's Fast and Secure Conference Meeting app.\nDownload Link:https://play.google.com/store/apps/details?id=com.japps.nammameet");
        },child: Icon(Icons.share))),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Wrap(
          children: [
            Container(
              height: dheight / 2,
              width: dwidth,
              color: Colors.deepPurple,
              child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: "Namma:",
                          style: TextStyle(
                              fontSize: dheight * 0.09,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text:"\nMeet",
                                  style:TextStyle()
                                )
                              ]
                              )
                              
                              )),
            ),
            Container(
              height: dheight / 2,
              width: dwidth,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(children: [
Center(child: InkWell(onTap: (){launch("https://jayateertha043.github.io/Namma-Meet/policies.html");},child: Text("Privacy Policy",style: TextStyle(decoration:TextDecoration.underline)))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Made with "),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text(" in India")
                    ],
                  ),
                  
                ]),
              ),
            ),
          ],
        ),
        Center(
            child: SizedBox(
          height: dheight * 0.2,
          width: dwidth * 0.4,
          child: Card(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: dheight * 0.07,
                    width: dwidth * 0.35,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        nameText.clear();
                        roomText.clear();
                        subjectText.clear();
                        print("tapped");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      "Create Meeting:",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(height: 20),
                                    Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          "Name:\t",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                        ),
                                        Container(
                                          width: dwidth * 0.25,
                                          height: 40,
                                          child: TextField(
                                            controller: nameText,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white70,
                                                hintText: "Your Name",
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(height: 20),
                                    Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          "Meeting Name: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                        ),
                                        Container(
                                          width: dwidth * 0.25,
                                          height: 40,
                                          child: TextField(
                                            controller: roomText,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white70,
                                                hintText:
                                                    "Give a Unique Meeting Name/Id",
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(height: 20),
                                    Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          "Meeting Subject: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                        ),
                                        Container(
                                          width: dwidth * 0.25,
                                          height: 40,
                                          child: TextField(
                                            controller: subjectText,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white70,
                                                hintText:
                                                    "Enter Meeting Subject",
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(height: 15),
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: Colors.purple,
                                        onPressed: () {
                                          _createMeeting();
                                        },
                                        child: Text("Create Meeting",
                                            style: TextStyle(
                                                color: Colors.white70))),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Card(
                          color: Colors.deepPurple[300],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_box,
                                color: Colors.white,
                              ),
                              Container(
                                width: 20,
                              ),
                              Text(
                                "CREATE MEETING",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: dheight * 0.07,
                    width: dwidth * 0.35,
                    child: InkWell(
                      splashColor: Colors.orange,
                      onTap: () {
                        nameText.clear();
                        roomText.clear();
                        subjectText.clear();
                        print("tapped");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      "JOIN Meeting:",
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(height: 20),
                                    Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          "Name:\t",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                        ),
                                        Container(
                                          width: dwidth * 0.25,
                                          height: 40,
                                          child: TextField(
                                            controller: nameText,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white70,
                                                hintText: "Your Name",
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(height: 20),
                                    Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          "Meeting Name/ID: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70),
                                        ),
                                        Container(
                                          width: dwidth * 0.25,
                                          height: 40,
                                          child: TextField(
                                            controller: roomText,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white70,
                                                hintText:
                                                    "Enter Meeting Name/Id to join",
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(height: 20),
                                    Container(height: 15),
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: Colors.purple,
                                        onPressed: () {
                                          _joinMeeting();
                                        },
                                        child: Text("Join Meeting",
                                            style: TextStyle(
                                                color: Colors.white70))),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Card(
                          color: Colors.pink[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.green[300],
                              ),
                              Container(
                                width: 20,
                              ),
                              Text(
                                "JOIN MEETING",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                  ),
                ]),
          ),
        ))
      ]),
    );
  }

  _createMeeting() async {
    try {
      var options = JitsiMeetingOptions()
        ..room = roomText.text
        ..subject = subjectText.text
        ..userDisplayName = nameText.text
        ..videoMuted = true
        ..audioMuted = false;
      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
          debugPrint("${options.room} will join with message: $message");
        }, onConferenceJoined: ({message}) {
          debugPrint("${options.room} joined with message: $message");
        }, onConferenceTerminated: ({message}) {
          debugPrint("${options.room} terminated with message: $message");
        }),
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  _joinMeeting() async {
    try {
      var options = JitsiMeetingOptions()
        ..room = roomText.text
        ..userDisplayName = nameText.text
        ..videoMuted = true
        ..audioMuted = false;
      debugPrint("JitsiMeetingOptions: $options");
      await JitsiMeet.joinMeeting(
        options,
        listener: JitsiMeetingListener(onConferenceWillJoin: ({message}) {
          debugPrint("${options.room} will join with message: $message");
        }, onConferenceJoined: ({message}) {
          debugPrint("${options.room} joined with message: $message");
        }, onConferenceTerminated: ({message}) {
          debugPrint("${options.room} terminated with message: $message");
        }),
      );
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  void _onConferenceWillJoin({message}) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined({message}) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated({message}) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}

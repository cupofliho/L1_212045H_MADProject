import 'dart:ffi';
import 'dart:ui';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/screens/home_page.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_firestoreapp/screens/account.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/model/message.dart';
import 'package:firebase_firestoreapp/model/user.dart';

import 'package:firebase_firestoreapp/screens/message.dart';

bool checkmsgid(int id) {
  if (id == 1) {
    return true;
  } else {
    return false;
  }
}

class MessageBox extends StatefulWidget {
  final newmesage = TextEditingController();
  String userid;
  String contactid;
  MessageBox({Key key, this.userid, this.contactid}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Newmewssagebox();
  }
}

class Newmewssagebox extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(widget.contactid);
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
                width: 450,
                height: 150,
                child: FutureBuilder<List<User>>(
                    future: FirestoreService().readUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index].userID ==
                                widget.contactid) {
                              return Container(
                                  decoration: BoxDecoration(
                                      gradient: purpleGradient,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 5.5,
                                          blurRadius: 5.5,
                                        )
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              // SizedBox(height: 32,),
                                              CircleAvatar(
                                                  radius: 35,
                                                  // backgroundColor: Colors.grey,
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: AssetImage(
                                                        snapshot.data[index]
                                                            .profilepic),
                                                  ))
                                            ]),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 28,
                                              // child: FutureBuilder<List<User>>(
                                              //   future: FirestoreService().readUserData(),
                                              //   builder: (context, snapshot){
                                              //     if(snapshot.hasData)
                                              //     {
                                              //       return ListView.builder(
                                              //         itemCount: 1,
                                              //         itemBuilder: (context,index){
                                              //           if(snapshot.data[index].userID == widget.contactid)
                                              //           {
                                              //             return Container(
                                              child: DefaultTextStyle(
                                                  child: Text(snapshot
                                                      .data[index].fname),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 30)),
                                              //             );
                                              //           }
                                              //         },
                                              //       );
                                              //     }
                                              //   },
                                              // )
                                              // child: DefaultTextStyle(
                                              //     child: Text("boo"),
                                              //     style: TextStyle(
                                              //         fontWeight: FontWeight.bold,
                                              //         color: Colors.white,
                                              //         fontSize: 30)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 60),
                                        GestureDetector(
                                          onTap: () async {
                                            final url = 'tel:';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            }
                                          },
                                          child: Column(
                                            children: <Widget>[
                                              // SizedBox(height: 30),
                                              Icon(Icons.phone,
                                                  color: Colors.white,
                                                  size: 40),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            } else {
                              print('cannot find');
                              return SizedBox(height:0);
                            }
                          },
                        );
                      }
                      else{
                        print("cant read user data");
                        return Text("");

                      }
                    })),
            SingleChildScrollView(
              child: Container(
                  color: Color.fromRGBO(239, 255, 251, 1),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 400,
                              height: 370,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Expanded(
                                      child: SizedBox(
                                          height: 400,
                                          child: FutureBuilder<List<Message>>(
                                              future: FirestoreService()
                                                  .readMessageData(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return ListView.builder(
                                                      itemCount:
                                                          snapshot.data.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        if (snapshot.data[index]
                                                                .sender ==
                                                            widget.userid && snapshot.data[index].receiver == widget.contactid) {
                                                          return Container(
                                                              width: 300,
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Container(
                                                                        width:
                                                                            200,
                                                                        decoration: BoxDecoration(
                                                                            gradient:
                                                                                purpleGradient,
                                                                            borderRadius:
                                                                                BorderRadius.circular(20)),
                                                                        child: Padding(
                                                                            padding: EdgeInsets.all(10),
                                                                            child: Text(
                                                                              snapshot.data[index].message,
                                                                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                                                            )))
                                                                  ]));
                                                        } else if (snapshot
                                                                .data[index]
                                                                .receiver ==
                                                            widget.userid && snapshot.data[index].sender == widget.contactid) {
                                                          return Container(
                                                              width: 300,
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox(
                                                                        width:
                                                                            10),
                                                                    Container(
                                                                        decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: Colors.black12,
                                                                                spreadRadius: 5.5,
                                                                                blurRadius: 5.5,
                                                                              )
                                                                            ],
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                        child: Padding(
                                                                            padding: EdgeInsets.all(10),
                                                                            child: Text(
                                                                              snapshot.data[index].message,
                                                                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                                                            )))
                                                                  ]));
                                                        } else {
                                                          return Text("");
                                                        }
                                                      });
                                                }
                                              })))),
                            ),
                            SingleChildScrollView(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(32),
                                      // border: Border.all(
                                      //   color: Colors.black,
                                      //   width: 5,
                                      // )
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2.0,
                                          blurRadius: 12.0,
                                        ),
                                      ]),
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: TextField(
                                          controller: widget.newmesage,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter your text',
                                              hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey)))),
                                ),
                                GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1.0,
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                          color: Color(0xFFBF4954),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: Icon(Icons.send,
                                            size: 30, color: Colors.white)),
                                  ),
                                  onTap: () {
                                    print(
                                        widget.newmesage.text + widget.userid);
                                    FirestoreService().adduserMessage(
                                        widget.newmesage.text,
                                        widget.userid,
                                        widget.contactid);
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MessageBox()));
                                  },
                                )
                              ],
                            ))
                          ]))),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.home,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: () {
Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(userid: widget.userid)));              },
            ),
            GestureDetector(
                child: Icon(
                  Icons.message,
                  size: 30.0,
                  color: Color(0xFFBF4954),
                ),
                onTap: () {Navigator.pop(context);}),
            GestureDetector(
                child: Icon(
                  Icons.person,
                  size: 30.0,
                  color: Color(0xFFBF4954),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Profile(userid: widget.userid)));
                }),
          ],
        ),
      ),
    );
  }
}

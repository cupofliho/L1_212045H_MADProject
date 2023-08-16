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

class Aboutus extends StatefulWidget {
  // final newmesage = TextEditingController();
  // String userid;
  // String contactid;
  // MessageBox({Key key, this.userid, this.contactid}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Aboutus();
  }
}

class _Aboutus extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // print(widget.contactid);
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: purpleGradient,
                        borderRadius: BorderRadius.only(
                            // bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(50))),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'About us',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height:10),
              Container(height:200,width:200,child:Image(image: AssetImage('images/logo.png'))),
              SizedBox(height: 15),
              Padding(padding: EdgeInsets.all(10),
              child:              
              Container(
                width: 350,
                height: 250,
                child:              
              Text("In our pursuit of enhancing healthcare accessibility and convenience, we aim to revolutionize the doctor-patient connection. Our goal is to streamline and expedite the appointment booking process, making it incredibly user-friendly. Through cutting-edge technology and intuitive interfaces, we're working towards a system that effortlessly links patients with their preferred doctors. This approach not only optimizes the healthcare-seeking experience but also ensures that medical attention is just a few clicks away. By bridging the gap between patients and doctors, we are committed to delivering efficient, timely, and simplified healthcare solutions for all."
              ,style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
              ),
              ),

),              GestureDetector(
                onTap: () async{
                  await launch("mailto:contact@guardiandoctor.com");
                },
                child:Text("email us")
              ) 
        ],
      )
    );
  }
}

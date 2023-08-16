import 'package:firebase_firestoreapp/model/appointment.dart';
import 'package:firebase_firestoreapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/screens/messagebox.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:firebase_firestoreapp/screens/account.dart';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/screens/message.dart';

import 'package:firebase_firestoreapp/model/message.dart';

class PrevAppointment extends StatefulWidget {
  final String userid;

  PrevAppointment({Key key, this.userid}) : super(key: key);

  @override
  _PrevAppointment createState() => _PrevAppointment();
}

class _PrevAppointment extends State<PrevAppointment> {
  final TextEditingController searchbar = TextEditingController();
  Future<List<Map<String, dynamic>>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() async {
    _usersFuture = FirestoreService().getUsersByMessage(widget.userid);
  }

  String searchuser = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(239, 255, 251, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        gradient: purpleGradient,
                        borderRadius: BorderRadius.only(
                            // bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(35))),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Book Appointment',
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
              Container(
                  width: 400,
                  height: 500,
                  child: FutureBuilder<List<Appointment>>(
                      future: FirestoreService().readAppointmentData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print("this has data");
                          print(snapshot.data.length);

                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if(snapshot.data[index].booked == "true" && snapshot.data[index].memberid == widget.userid)
                                if(snapshot.data[index].paid == "true")
                                {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1.0,
                                            blurRadius: 6.0,
                                          ),
                                        ]),
                                    child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                
                                                Text(
                                                  'Date: ' +
                                                      snapshot.data[index].date,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 30),
                                                Text(
                                                  'Time: ' +
                                                      snapshot.data[index].time,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                             Text(
                                                  'Price: ' +
                                                      snapshot.data[index].price,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              SizedBox(height: 30),
                                                Text(
                                                  'Paid',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                            // RaisedButton(
                                            //   onPressed: () {
                                            //   FirestoreService().updateAppointmentData(snapshot.data[index].appointmentid, 'true', snapshot.data[index].date, snapshot.data[index].doctorid, widget.userid, snapshot.data[index].paid, snapshot.data[index].price, snapshot.data[index].time);
                                            //   },
                                            //   shape: RoundedRectangleBorder(
                                            //       borderRadius:
                                            //           BorderRadius.circular(
                                            //               80.0)),
                                            //   padding:
                                            //       const EdgeInsets.all(0.0),
                                            //   child: Ink(
                                            //     decoration: const BoxDecoration(
                                            //       gradient: purpleGradient,
                                            //       borderRadius:
                                            //           BorderRadius.all(
                                            //               Radius.circular(
                                            //                   80.0)),
                                            //     ),
                                            //     child: Container(
                                            //       constraints:
                                            //           const BoxConstraints(
                                            //               minWidth: 88.0,
                                            //               minHeight: 36.0),
                                            //       alignment: Alignment.center,
                                            //       child: const Text(
                                            //         'Pay',
                                            //         style: TextStyle(
                                            //             fontWeight:
                                            //                 FontWeight.w300,
                                            //             fontSize: 13,
                                            //             color: Colors.white),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        )));
                                }
                                else{
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1.0,
                                            blurRadius: 6.0,
                                          ),
                                        ]),
                                    child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                
                                                Text(
                                                  'Date: ' +
                                                      snapshot.data[index].date,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 30),
                                                Text(
                                                  'Time: ' +
                                                      snapshot.data[index].time,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                             Text(
                                                  'Price: ' +
                                                      snapshot.data[index].price,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              SizedBox(height: 30),
                                                Text(
                                                  'unPaid',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                            RaisedButton(
                                              onPressed: () {
                                              FirestoreService().updateAppointmentData(snapshot.data[index].appointmentid, 'true', snapshot.data[index].date, snapshot.data[index].doctorid, widget.userid, 'true', snapshot.data[index].price, snapshot.data[index].time);
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80.0)),
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: const BoxDecoration(
                                                  gradient: purpleGradient,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              80.0)),
                                                ),
                                                child: Container(
                                                  constraints:
                                                      const BoxConstraints(
                                                          minWidth: 88.0,
                                                          minHeight: 36.0),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'Pay',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )));
                                }
                              });
                        } else {
                          print("no user data");
                        }
                      })),
            ],
          ),
        ),
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
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.message,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MessagePage(userid: widget.userid)));
              },
            ),
            GestureDetector(
                child: Icon(
                  Icons.person,
                  size: 30.0,
                  color: Color(0xFFBF4954),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                }),
          ],
        ),
      ),
    );
  }
}

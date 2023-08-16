import 'package:firebase_firestoreapp/model/appointment.dart';
import 'package:firebase_firestoreapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/screens/messagebox.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:firebase_firestoreapp/screens/account.dart';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/screens/message.dart';

import 'package:firebase_firestoreapp/model/message.dart';

class UpdateAppointment extends StatefulWidget {
  final String userid;

  UpdateAppointment({Key key, this.userid}) : super(key: key);

  @override
  _UpdateAppointment createState() => _UpdateAppointment();
}

class _UpdateAppointment extends State<UpdateAppointment> {
  final TextEditingController searchbar = TextEditingController();
  Future<List<Map<String, dynamic>>> _usersFuture;

Future<void> updateappt(userid,memberid)
  {      
    TextEditingController date = TextEditingController();
    TextEditingController time = TextEditingController();
    TextEditingController price = TextEditingController();

    return showDialog(
      
      context: context,
      builder: (context){
        return Scaffold(
          body: SingleChildScrollView(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 140),
          Container(
          child: DefaultTextStyle(child:Text('update appointment'), style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
        ),
        SizedBox(height: 40),
        Container(width: 400,height: 350,
        child:FutureBuilder<List<Appointment>>(
          future: FirestoreService().readAppointmentData(),
          builder: (context,snapshot){
            if (snapshot.hasData)
            {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  if(snapshot.data[index].doctorid == userid && snapshot.data[index].memberid == memberid)
                  {
                    return Column(children: [
                      TextFormField(
                            controller: date,
                            decoration: InputDecoration(
                              labelText: snapshot.data[index].date,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: time,
                            decoration: InputDecoration(
                              labelText: snapshot.data[index].time,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          TextFormField(
                            controller: price,
                            decoration: InputDecoration(
                              labelText: snapshot.data[index].price,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                          onPressed: () {
                          

                              String _time = time.text;                              
                              if(_time == "")
                              {
                                _time = snapshot.data[index].time;
                              }
                            String _date = date.text;
                            if(_date == "")
                              {
                                _date = snapshot.data[index].date;
                              }
                            String _price = price.text;    
                            if(_price == "")
                              {
                                _price = snapshot.data[index].price;
                              }
                           
                              FirestoreService().updateAppointmentData(snapshot.data[index].appointmentid, snapshot.data[index].booked, _date, snapshot.data[index].doctorid, snapshot.data[index].memberid, snapshot.data[index].paid, _price, _time);
                            // Handle Confirm Changes button press here
                            
                            // var userdata = FirestoreService().readUserData();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFBF4954),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Confirm Changes'),
                        ),
                    ],);
                  } 
                  else{
                    return SizedBox(height: 0);
                  }

                }
              );
            }
          }
          )
        ),
        
        InkResponse(
              onTap: () {
                Navigator.pop(context); 
              },
              splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:Container(
                width:60,
                height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),                
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('Cancel',style: TextStyle(color: Colors.grey),)

                          ],)
              )
            ),
        ],),
        ));
        
        
        
      }

    );
  }

  Future<void> addAppointment(userid)
  {      
    TextEditingController date = TextEditingController();
    TextEditingController time = TextEditingController();
    // TextEditingController price = TextEditingController();

    return showDialog(
      
      context: context,
      builder: (context){
        return Scaffold(
          body: SingleChildScrollView(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 140),
          Container(
          child: DefaultTextStyle(child:Text('update appointment'), style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
        ),
        SizedBox(height: 40),
        Container(width: 400,height: 350,
        child:
        // child:FutureBuilder<List<Appointment>>(
        //   future: FirestoreService().readAppointmentData(),
        //   builder: (context,snapshot){
        //     if (snapshot.hasData)
        //     {
        //       return ListView.builder(
        //         itemCount: snapshot.data.length,
        //         itemBuilder: (context,index){
        //           if(snapshot.data[index].doctorid == userid )
        //           {
        //             return 
        Column(children: [
                      TextFormField(
                            controller: date,
                            decoration: InputDecoration(
                              labelText: "Date",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: time,
                            decoration: InputDecoration(
                              labelText: "Time",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                          onPressed: () {
                          

                              String _time = time.text;                              
                            String _date = date.text;
                            if(_time != "" && _date != "")
                              {
                                FirestoreService().addAppointment(userid, "", _date, _time);

                              }
                           
                            // Handle Confirm Changes button press here
                            
                            // var userdata = FirestoreService().readUserData();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFBF4954),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Confirm Changes'),
                        ),
                    ],)),
          //         } 
          //         else{
          //           return SizedBox(height: 0);
          //         }

          //       }
          //     );
          //   }
          // }
          // )
        
        
        InkResponse(
              onTap: () {
                Navigator.pop(context); 
              },
              splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:Container(
                width:60,
                height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),                
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('Cancel',style: TextStyle(color: Colors.grey),)

                          ],)
              )
            ),
        ],),
        ));
        
        
        
      }

    );
  }

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
      // backgroundColor: Color(0xFFf2f2f2),
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
                          'Current Appointment',
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
                                if(snapshot.data[index].doctorid == widget.userid)
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
                                                SizedBox(height: 15),
                                                Text(
                                                  'Time: ' +
                                                      snapshot.data[index].time,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Text(
                                                  'Price: ' +
                                                      snapshot.data[index].price,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(children: [
                                              // Text(
                                              //     'Price: ' +
                                              //         snapshot.data[index].price,
                                              //     style: TextStyle(
                                              //       color: Colors.black,
                                              //       fontSize: 16,
                                              //       fontWeight: FontWeight.w600,
                                              //     ),
                                              //   ),
                                                Text(
                                                  'Book status: ' +
                                                      snapshot.data[index].booked,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                            ],),
                                            
                                              SizedBox(height: 30),
                                                // Text(
                                                //   'unPaid',
                                                //   style: TextStyle(
                                                //     color: Colors.red,
                                                //     fontSize: 16,
                                                //     fontWeight: FontWeight.w600,
                                                //   ),
                                                // ),
                                            RaisedButton(
                                              onPressed: () {
                                              Navigator.pop(context);
                                              updateappt(widget.userid, snapshot.data[index].memberid);
                                              // FirestoreService().updateAppointmentData(snapshot.data[index].appointmentid, 'true', snapshot.data[index].date, snapshot.data[index].doctorid, widget.userid, 'true', snapshot.data[index].price, snapshot.data[index].time);
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
                                                    'Update',
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
                                else{
                                  
                                  return Text("");
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xFFBF4954),
        ),
        backgroundColor: Colors.white,
        // tooltip: 'Sign Out',
        onPressed: () async {
          addAppointment(widget.userid);
        },
      ),
    );
  }
}

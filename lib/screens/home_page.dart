import 'package:firebase_firestoreapp/screens/aboutus.dart';
import 'package:firebase_firestoreapp/screens/appointment.dart';
import 'package:firebase_firestoreapp/screens/bookappointment.dart';
import 'package:firebase_firestoreapp/screens/prevappointments.dart';
import 'package:firebase_firestoreapp/screens/updateappointment.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/card.dart';
import 'package:firebase_firestoreapp/screens/message.dart';
import 'package:firebase_firestoreapp/screens/account.dart';
import 'package:firebase_firestoreapp/model/reminders.dart';
import 'package:firebase_firestoreapp/model/user.dart';
import 'package:firebase_firestoreapp/screens/appointment.dart';

import 'package:firebase_firestoreapp/screens/reminder.dart';
import 'package:firebase_firestoreapp/services/firebaseauth_service.dart';

class HomePage extends StatefulWidget {
   String userid;
   HomePage({Key key,this.userid}): super(key:key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _listPages = List();
bool havereminder = false;
  // @override
  // void initState() {
  //   super.initState();

  //   _listPages
  //     ..add(Message())
  //     ..add(Profile())
  //     ..add(Reminders())
  //     ..add(Appointment())
  //     ..add(BkAppt());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  alignment: AlignmentDirectional.topCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                          gradient: purpleGradient,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'How are you feeling today ?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -45,
                      child: Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width - 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5.5,
                                blurRadius: 5.5,
                              )
                            ]),
                        child: MoodsSelector(),
                      ),
                    ),
                  ]),

              // Text("WELCOME HOME", style: TextStyle(fontSize: 30)),
              SizedBox(height: 80),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFBF4954),
                  // gradient: redGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                    title: Text(
                      'Reminders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: OutlineButton(
                      onPressed: () {
                         Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reminders(userid: widget.userid)));
                      },
                      color: Colors.transparent,
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Text(
                        'Review & Add Notes',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container( 
                    width: 550,height: 120,
                    child:FutureBuilder<List<Reminder>>(
                    future: FirestoreService().readReminder(),
                    builder: (context,snapshot){
                      if(snapshot.hasData)
                      {             
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,             
                          itemCount: 2,
                          itemBuilder: 
                          (context,index)
                          {
                          if(snapshot.data[index].userId == widget.userid)
                            {
                            return  
                              Container(
                                margin: EdgeInsets.only(left:15,right: 15),
                                height: 140,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                                  child:Padding(padding:EdgeInsets.all(10),child:Text(snapshot.data[index].reminder,style: TextStyle(color: Color(0xFFBF4954),fontSize: 14,fontWeight: FontWeight.w500,),))
                              );
                            }
                            else{
                              return  Container(
                                margin: EdgeInsets.only(left:15,right: 15),
                                height: 140,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                                  child:Padding(padding:EdgeInsets.all(10),child:Text('Add in new reminder today !!',style:TextStyle(color:Colors.grey)),)
                              );
                            }
                          }
                        );
                      }
                    }
                  )
                ),
                  
              SizedBox(height: 30),

                ]),
              ),
              Container(width: 400,height: 300,
                  child:FutureBuilder<List<User>>(
                    future:FirestoreService().readUserData(),
                    builder:(context,userrole){
                      if(userrole.hasData)
                      {
                        return ListView.builder(
                          itemCount:userrole.data.length,
                          itemBuilder: (context,index)
                          {
                            if(userrole.data[index].userID == widget.userid && userrole.data[index].role == "member")
                            {
                              return 
                              Container(
                                  width: 400,
                                  height: 300,
                                  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                                  margin: EdgeInsets.only(
                                    bottom: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1.0,
                                          blurRadius: 6.0,
                                        ),
                                      ]),
                                  child: 
                                  FutureBuilder<List<User>>(
                                    future: FirestoreService().readUserData(),
                                    builder: (context,snapshot){
                                      if(snapshot.hasData)
                                      {
                                        return ListView.builder(
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context,index){
                                            if(snapshot.data[index].role == 'doctor')
                                            {                       
                                              print(snapshot.data.length);

                                              return 
                                                  Container(child:Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      CircleAvatar(
                                                        backgroundColor: Color(0xFFD9D9D9),
                                                        backgroundImage: AssetImage(snapshot.data[index].profilepic),
                                                        radius: 36.0,
                                                      ),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          RichText(
                                                            text: TextSpan(
                                                              text: 'Book your appointment \n',
                                                              style: TextStyle(
                                                                color: Colors.purple,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w400,
                                                                height: 1.3,
                                                              ),
                                                              children: <TextSpan>[
                                                                TextSpan(
                                                                  text: 'Dr ' + snapshot.data[index].fname + " "+snapshot.data[index].lname,
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 6.0,
                                                          ),
                                                          RaisedButton(
                                                            onPressed: () {
                                                      Navigator.push(context,MaterialPageRoute(builder: (context) => BookAppointment(userid: widget.userid)));
                                                            },
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(80.0)),
                                                            padding: const EdgeInsets.all(0.0),
                                                            child: Ink(
                                                              decoration: const BoxDecoration(
                                                                gradient: purpleGradient,
                                                                borderRadius:
                                                                    BorderRadius.all(Radius.circular(80.0)),
                                                              ),
                                                              child: Container(
                                                                constraints: const BoxConstraints(
                                                                    minWidth: 88.0, minHeight: 36.0),
                                                                alignment: Alignment.center,
                                                                child: const Text(
                                                                  'Book Visit',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.w300,
                                                                      fontSize: 13,
                                                                      color: Colors.white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),)
                                                  ;
                                                }
                                                else{
                                                  return Text('');
                                                }
                                              }
                                            
                                            );
                                      }
                                      else{
                                        print("no data");
                                      }
                                    }
                                  )
                                );
                              }
                            else{
                              return 
                              // Container(
                              //     width: 400,
                              //     height: 300,
                              //     padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                              //     margin: EdgeInsets.only(
                              //       bottom: 20.0,
                              //     ),
                              //     decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         borderRadius: BorderRadius.circular(12.0),
                              //         boxShadow: [
                              //           BoxShadow(
                              //             color: Colors.grey.withOpacity(0.2),
                              //             spreadRadius: 1.0,
                              //             blurRadius: 6.0,
                              //           ),
                              //         ]),
                              //     child: 
                              //     FutureBuilder<List<User>>(
                              //       future: FirestoreService().readUserData(),
                              //       builder: (context,snapshot){
                              //         if(snapshot.hasData)
                              //         {
                              //           return ListView.builder(
                              //             itemCount: snapshot.data.length,
                              //             itemBuilder: (context,index){
                              //               if(snapshot.data[index].role == 'doctor')
                              //               {                       
                              //                 print(snapshot.data.length);

                              //                 return 
                              //                     Container(child:Row(
                              //                       mainAxisAlignment: MainAxisAlignment.start,
                              //                       crossAxisAlignment: CrossAxisAlignment.start,
                              //                       children: <Widget>[
                              //                         CircleAvatar(
                              //                           backgroundColor: Color(0xFFD9D9D9),
                              //                           backgroundImage: AssetImage(snapshot.data[index].profilepic),
                              //                           radius: 36.0,
                              //                         ),
                              //                         SizedBox(
                              //                           width: 10.0,
                              //                         ),
                              //                         Column(
                              //                           mainAxisAlignment: MainAxisAlignment.start,
                              //                           crossAxisAlignment: CrossAxisAlignment.start,
                              //                           children: <Widget>[
                              //                             RichText(
                              //                               text: TextSpan(
                              //                                 text: 'Book your appointment \n',
                              //                                 style: TextStyle(
                              //                                   color: Colors.purple,
                              //                                   fontSize: 12,
                              //                                   fontWeight: FontWeight.w400,
                              //                                   height: 1.3,
                              //                                 ),
                              //                                 children: <TextSpan>[
                              //                                   TextSpan(
                              //                                     text: 'Dr ' + snapshot.data[index].fname + " "+snapshot.data[index].lname,
                              //                                     style: TextStyle(
                              //                                       color: Colors.black,
                              //                                       fontSize: 16,
                              //                                       fontWeight: FontWeight.w600,
                              //                                     ),
                              //                                   ),
                              //                                 ],
                              //                               ),
                              //                             ),
                              //                             SizedBox(
                              //                               height: 6.0,
                              //                             ),
                              //                             RaisedButton(
                              //                               onPressed: () {
                              //                         Navigator.push(context,MaterialPageRoute(builder: (context) => BookAppointment(userid: widget.userid)));
                              //                               },
                              //                               shape: RoundedRectangleBorder(
                              //                                   borderRadius: BorderRadius.circular(80.0)),
                              //                               padding: const EdgeInsets.all(0.0),
                              //                               child: Ink(
                              //                                 decoration: const BoxDecoration(
                              //                                   gradient: purpleGradient,
                              //                                   borderRadius:
                              //                                       BorderRadius.all(Radius.circular(80.0)),
                              //                                 ),
                              //                                 child: Container(
                              //                                   constraints: const BoxConstraints(
                              //                                       minWidth: 88.0, minHeight: 36.0),
                              //                                   alignment: Alignment.center,
                              //                                   child: const Text(
                              //                                     'Book Visit',
                              //                                     style: TextStyle(
                              //                                         fontWeight: FontWeight.w300,
                              //                                         fontSize: 13,
                              //                                         color: Colors.white),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ],
                              //                     ),)
                              //                     ;
                              //                   }
                              //                   else{
                              //                     return Text('');
                              //                   }
                              //                 }
                                            
                              //               );
                              //         }
                              //         else{
                              //           print("no data");
                              //         }
                              //       }
                              //     )
                              //   );
                              SizedBox(height:0);
                            }
                          }
                        );
                      }
                    }
                  )
                 
                ),


              Container(width: 400,height: 100,
                  child:FutureBuilder<List<User>>(
                    future:FirestoreService().readUserData(),
                    builder:(context,userrole){
                      if(userrole.hasData)
                      {
                        return ListView.builder(
                          itemCount:userrole.data.length,
                          itemBuilder: (context,index)
                          {
                            if(userrole.data[index].userID == widget.userid )
                            {
                              if(userrole.data[index].role == "member"){
                              return 
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => PrevAppointment(userid: widget.userid)));

                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                                    margin: EdgeInsets.only(
                                      bottom: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1.0,
                                            blurRadius: 6.0,
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                RichText(
                                                  text: TextSpan(
                                                    text: 'Appointments \n',
                                                    style: TextStyle(
                                                      color: Colors.purple,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.3,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: 'Check Previous Appointments >',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6.0,
                                                ),
                                                
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            else{
                              return 
                              SizedBox(height:0);
                            }
                            }
                            else{
                              return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateAppointment(userid: widget.userid)));

                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                                    margin: EdgeInsets.only(
                                      bottom: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1.0,
                                            blurRadius: 6.0,
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                RichText(
                                                  text: TextSpan(
                                                    text: 'Appointments \n',
                                                    style: TextStyle(
                                                      color: Colors.purple,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.3,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: 'Appointments >',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6.0,
                                                ),
                                                
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                            }

                          }
                        );
                      }
                    }
                  )
                 
                ),
              
              SizedBox(
                height:10
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Aboutus()));

                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1.0,
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: 'Learn more \n',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Learn more about us >',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              
            ]),
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
              onTap: null,
            ),
            GestureDetector(
              child: Icon(
                Icons.message,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: () {
                print(widget.userid);
                Navigator.push(context,MaterialPageRoute(builder: (context) => MessagePage(userid: widget.userid)));}
            ),
            GestureDetector(
              child: Icon(
                Icons.person,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: () {
                print(widget.userid);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(userid: widget.userid,)));}
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.logout,
          color: Color(0xFFBF4954),
        ),
        backgroundColor: Colors.white,
        tooltip: 'Sign Out',
        onPressed: () async {
          await FirebaseAuthService().signOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
} //HomePageState

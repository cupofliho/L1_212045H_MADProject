import 'dart:ui';
import 'package:projv3/profile/aboutus.dart';
import 'package:projv3/message/message.dart';
import 'package:projv3/profile/profile.dart';
import 'package:projv3/profile/profileedit.dart';
import 'dart:async';
import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import '../profile/bills.dart';
import '../profile/aboutus.dart';

import 'package:flutter/material.dart';
class PrevBkAppt extends StatefulWidget {
  Contactmessage message;
  Contactslist contactslist;
  ApptList apptlist;
  UserList userList;
  Appt appt;
  User user;
  int id; 
  bool newappt;
  bool loggedbefore;
  bool newmsg;
  String email;
  String formattedDate;
  PrevBkAppt({Key key, this.apptlist,this.userList,this.user,this.id,this.newappt,this.email,this.loggedbefore,this.formattedDate,this.contactslist}): super (key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PrevBookAppointment();
  }
}

class PrevBookAppointment extends State<PrevBkAppt>{
bool click1 = false;
bool click2 = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(width: 450,color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  DefaultTextStyle(child:Text('Your previous'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 40)),
                  DefaultTextStyle(child:Text('appointments'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 40)),
                ]
              ),
              Container(width:400,height:400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.white),child:Padding(padding: EdgeInsets.all(20),child:SingleChildScrollView(child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Container(decoration:BoxDecoration(border: Border(bottom:BorderSide(width:5,color:Colors.black))),child:Row(mainAxisAlignment:MainAxisAlignment.center,children:<Widget>[Padding(padding:EdgeInsets.only(bottom:20,top:30),child:Text('Notes',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))])),
                  Padding(padding:EdgeInsets.all(10) ,child:Column(children: <Widget>[
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                        Container(child:Text('30 Now 2022',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                        GestureDetector(child:Icon(Icons.keyboard_arrow_up,color: Color.fromRGBO(79, 152, 202, 1),size:40),
                      onTap: (){
                        print('no');
                        setState(() {
                          click1 == false? click1 = true : click1 = false;
                        });
                      },
                    ),
                  ]),
                    if(click1 == true)
                    ...[
                      Padding(padding: EdgeInsets.all(10),child:
                        Text('Doctor Advice: Take antibiotic once every 6hrs and work on that knee',style:TextStyle(color:Color.fromRGBO(79, 152, 202, 1,),fontWeight: FontWeight.bold,fontSize: 15))
                      ),
                      Image(image: AssetImage("images/kneestretch.png"),height:130),
                      ],
                  Container(height:10,decoration:BoxDecoration(border: Border(bottom: BorderSide(color:Colors.black,width:5)))),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                        Container(child:Text('10 Now 2022',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                        GestureDetector(child:Icon(Icons.keyboard_arrow_up,color: Color.fromRGBO(79, 152, 202, 1),size:40),
                      onTap: (){
                        print('no');
                        setState(() {
                          click2 == false? click2 = true : click2 = false;
                        });
                      },
                    ),
                  ]),
                    if(click2 == true)
                    ...[
                      Padding(padding: EdgeInsets.all(10),child:
                        Text('Doctor Advice: Take antibiotic once every 6hrs and work on that knee',style:TextStyle(color:Color.fromRGBO(79, 152, 202, 1,),fontWeight: FontWeight.bold,fontSize: 15))
                      ),
                      Image(image: AssetImage("images/kneestretch.png"),height:130),
                      ],
                  Container(height:10,decoration:BoxDecoration(border: Border(bottom: BorderSide(color:Colors.black,width:5)))),

                    ]

                  ,))
                ]
                ),),
              ),
              )
              ]
            )
            )
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(color:Color.fromRGBO(239, 255, 251,1)),
            selectedItemColor: Color.fromRGBO(239, 255, 251,1),
             unselectedIconTheme: IconThemeData(color: Color.fromRGBO(239, 255, 251,1)),
            unselectedItemColor: Color.fromRGBO(239, 255, 251,1),
            backgroundColor: Color.fromRGBO(79, 152, 202,1),
            items:   <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Color.fromRGBO(239, 255, 251,1),),
                label:'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message,color: Color.fromRGBO(239, 255, 251,1)),
                label:'Messages'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,color: Color.fromRGBO(239, 255, 251,1)),
                label:'Profile',
              
              ),
              //BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
            ],
            onTap: (value) {
              if(value == 0)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,)));           
              } 
              if(value == 1)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,)));          

              }
              if (value == 2)
              {
                //MyData data = new MyData(widget.data.email,widget.data.pwd);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,)));            

              }
              },
          ),
        );


  }
}

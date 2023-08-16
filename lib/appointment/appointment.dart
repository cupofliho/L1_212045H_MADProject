import 'dart:ui';
import 'package:projv3/profile/aboutus.dart';
import 'package:projv3/appointment/bookappointment.dart';
import 'package:projv3/appointment/prevbookappointment.dart';
import 'package:projv3/profile/profileedit.dart';

import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import '../profile/bills.dart';
import '../profile/aboutus.dart';
import '../profile/profile.dart';
import 'package:flutter/material.dart';
import '../message/message.dart';

class Appointment extends StatelessWidget{
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
  Appointment({Key key, this.user, this.id,this.apptlist,this.userList,this.newappt,this.email,this.formattedDate,this.loggedbefore,this.contactslist,this.newmsg}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(width:400,color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child:
                Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[                  
                  DefaultTextStyle(child:Text('Appointments'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 40)),
                ],)
              ),
              GestureDetector(onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => BkAppt(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,contactslist: this.contactslist)));          
              },child:Padding(
                padding: EdgeInsets.only(top: 15),
                child:Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Color.fromRGBO(80, 216, 144, 1)),
                  child:Center(
                    child:Padding(padding: EdgeInsets.all(20),
                      child:DefaultTextStyle(child:Text('Book your next appoinment >'),style: TextStyle(fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),)
                    )
                  )
                )
              ),),
              GestureDetector(onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrevBkAppt(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList, newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,contactslist: this.contactslist)));
              },child: Padding(
                padding: EdgeInsets.only(top: 15),
                child:Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Color.fromRGBO(79, 152, 202, 1)),
                  child:Center(
                    child:Padding(padding: EdgeInsets.all(20),
                      child:DefaultTextStyle(child:Text('View Previous Appointments >'),style: TextStyle(fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),
                    )
                  )
                ))
              )),
              
            
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
                label:'Profile'
              ),
              //BottomNavigationBarItem(icon: Icon(Icons.home),label:'Home'),
            ],
              onTap: (value) {
                if(value == 0)
                {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg,contactslist: this.contactslist)));           
                } 
                if(value == 1)
                {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList, newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg: this.newmsg,contactslist: this.contactslist)));          
                }
              if (value == 2)
              {                  
                apptlist = ApptList();
                 if(newappt == null){
                  newappt = true;
                }
                if(newappt == true)
                {
                  apptlist.addappt(1, '30 Nov 2022', '\$350.00', 'paid');
                  apptlist.addappt(1, '20 Nov 2022', '\$500.00', 'paid');
                  apptlist.addappt(1, '10 Nov 2022', '\$500.00', 'paid');
                  apptlist.addappt(2, '15 Nov 2022', '\$100.00', 'paid');
                  newappt = false;
                }
                //User user;
                // data = new MyData(widget.data.email,widget.data.pwd);
                int id = this.id;
                UserList userList = this.userList;
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList, newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg,contactslist: this.contactslist)));            

              }
              },
          ),
        );

  }
}

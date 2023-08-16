import 'dart:ui';
import 'package:projv3/profile/aboutus.dart';
import 'profileedit.dart';
import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import 'bills.dart';
import 'aboutus.dart';
import '../login/register.dart';
import 'package:flutter/material.dart';
import '../message/message.dart';
class Profile extends StatelessWidget{
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
  Profile({Key key,@required this.user, this.id,this.userList, this.apptlist,this.loggedbefore,this.email,this.formattedDate,this.newappt,this.newmsg,this.contactslist}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child:
                  DefaultTextStyle(child:Text('Profile'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 25)),
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  SizedBox(height:50),
                  Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                    child:GestureDetector(
                      child:Padding(padding: EdgeInsets.all(15),
                        child:DefaultTextStyle(child:Text('Edit Profile >'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                      ),
                      onTap: () {
                        // userList = UserList();
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileEdit(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate, newmsg:this.newmsg, contactslist: this.contactslist)));
                      },
                    ),
                  ),
                  Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                    child:GestureDetector(
                      child:Padding(padding: EdgeInsets.all(15),
                        child:DefaultTextStyle(child:Text('View bills >'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20),)
                      ),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Bills(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate , newmsg:this.newmsg, contactslist: this.contactslist)));
                      },
                    ),
                  ),
                  Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                    child:GestureDetector(
                      child:Padding(padding: EdgeInsets.all(15),
                        child:DefaultTextStyle(child:Text('About us >'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                      ),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => AboutUs(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg, contactslist: this.contactslist)));
                      },
                    ),
                  ),
                  Container(width:400,
                    child:GestureDetector(child:Padding(padding: EdgeInsets.all(15),
                      child:DefaultTextStyle(child:Text('Logout >'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                      ),
                       onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Login(loggedbefore: true,userList: userList,)));
                      },
                    ),
                  ),
                  SizedBox(height:150)
            
                ]
                ),
              ),
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg, contactslist: this.contactslist)));           
              } 
              if(value == 1)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg, contactslist: this.contactslist)));          

              }
              if (value == 2)
              {
                //Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: widget.user)));            

              }
              },
          ),
        );

  }
}

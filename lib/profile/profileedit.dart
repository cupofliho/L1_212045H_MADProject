import 'dart:ui';
import 'package:projv3/home/home.dart';

import'../login/login.dart';
import 'package:flutter/material.dart';


import 'bills.dart';
import '../message/message.dart';
import 'profile.dart';

class ProfileEdit extends StatefulWidget{
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
  ProfileEdit({Key key,@required this.user, this.id,this.userList,this.apptlist,this.newappt,this.email,this.formattedDate,this.newmsg,this.contactslist}):super(key:key);
  @override
  State<StatefulWidget> createState() => EditedProfile();
  }
class EditedProfile extends State<ProfileEdit>{

final nameedit = TextEditingController();
final emailedit = TextEditingController();
String name;
String email;
Future<void> editName() async {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text('What would you like to change ur name till ?'),
        children: <Widget>[
          TextField(
            controller: nameedit,
            decoration: InputDecoration(hintText: "new name"),
          ),
          FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            child: Text('CANCEL'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }
          ),

          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('OK'),
            onPressed: () {
              if(nameedit.text != null)
              {
                setState(() {
                widget.user.name = nameedit.text;
                Navigator.pop(context);
              });
              }
              
                },
              ),        ],
      );
    },
  );
}

Future<void> editEmail() async {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text('What would you like to change your email to ?'),
        children: <Widget>[
          TextField(
            controller: emailedit,
            decoration: InputDecoration(hintText: "new email"),
          ),
          FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            child: Text('CANCEL'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            }
          ),

          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('OK'),
            onPressed: () {
              if(emailedit.text != null)
              {
                setState(() {
                widget.user.email = emailedit.text;
                Navigator.pop(context);
              });
              }
                },
              ),        ],
      );
    },
  );
}
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
                        child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:<Widget>[
                          DefaultTextStyle(
                            child:Text('Name : '+ widget.user.name),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)
                          ),
                          DefaultTextStyle(
                            child:Text('Edit'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)
                          ),                        
                        ]
                      ),
                      ),
                      onTap: () {
                        editName();
                      },
                    ),
                  ),
                  Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                    child:GestureDetector(
                      child:Padding(padding: EdgeInsets.all(15),                        
                        child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:<Widget>[
                          DefaultTextStyle(
                            child:Text('Email : ' + widget.user.email),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20),
                          ),
                          DefaultTextStyle(
                            child:Text('Edit'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)
                          ),     
                        ]
                      ),
                      ),
                      onTap: () {
                        editEmail();
                      },
                    ),
                ),
                  SizedBox(height:150),
                  GestureDetector(child:Text('confirm'),
                  onTap: (){

                   /* for (int i= 0;i<widget.userlist.users.length;i++)
                  {
                    if(widget.userlist.checkUser(widget.user.email,widget.user.password))
                    {*/
                      if(emailedit.text != null && nameedit.text != null)
                      {
                        print('no');
                        widget.userList.updateUser(widget.id,nameedit.text,emailedit.text,widget.user.password);
                      }
                      else if(emailedit.text == null && nameedit.text != null)
                      {
                        widget.userList.updateUser(widget.id,widget.user.name,emailedit.text,widget.user.password);
                      }
                      else if(emailedit.text != null && nameedit.text == null){
                        widget.userList.updateUser(widget.id,nameedit.text,widget.user.email,widget.user.password);
                      }
                      else
                      {
                        
                      }
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,newappt: this.widget.newappt,email: this.email,formattedDate: this.widget.formattedDate, newmsg:this.widget.newmsg, contactslist: this.widget.contactslist,loggedbefore: this.widget.loggedbefore,)));
                   /* }
     
                  }*/})
                
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList, newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg:this.widget.newmsg, contactslist: this.widget.contactslist)));           
              } 
              if(value == 1)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList, newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg:this.widget.newmsg, contactslist: this.widget.contactslist)));          

              }
              if (value == 2)
              {
                //MyData data = new MyData(widget.data.email,widget.data.pwd);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg:this.widget.newmsg, contactslist: this.widget.contactslist)));            

              }
              },
          ),
        );

  }
}

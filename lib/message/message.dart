import 'dart:ui';
import 'package:projv3/message/messagebox.dart';
import 'package:projv3/profile/profileedit.dart';

import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import '../profile/bills.dart';
import 'package:flutter/material.dart';
import '../profile/profile.dart';
class Contactmessage{
  int id;
  int userid;
  int docid;
  String contact;
  String message;
  Contactmessage({this.id,this.userid,this.docid,this.contact,this.message});
}
class Contactslist{
  List<String> Contact  = ['Dr Lee','Dr Kong'];
  List<Contactmessage> contactmessage = [];
  void addMessage(int newid,int userid,int docid,String newcontact,String newmessage)
  {
    Contactmessage message = Contactmessage(id: newid,userid:userid,docid:docid,contact: newcontact,message: newmessage);
    contactmessage.add(message);
  }
}
class Message extends StatelessWidget{
  final searchbar = TextEditingController();
  Contactslist contactslist;
  Contactmessage message;
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
  String searchresult;

Message({Key key, this.apptlist,this.userList,this.user,this.id,this.newappt,this.email,this.formattedDate,this.loggedbefore,this.contactslist,this.newmsg,this.searchresult}): super (key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(this.id);
    print(this.contactslist.contactmessage.length);
        return Scaffold(
          appBar:AppBar(),
          body: SingleChildScrollView(child:Container(color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child:
                  DefaultTextStyle(child:Text('Messages'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 30)),
              ),
              
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(children: <Widget>[Container(width: 300,child:TextField(
                    controller: searchbar,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    ),
                  ),),
                  GestureDetector(child:Padding(padding: EdgeInsets.all(10),child:Icon(Icons.send,size: 30,color: Color.fromRGBO(80,216,144,1))),
                onTap:() {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,contactslist: this.contactslist,newmsg:this.newmsg,searchresult: searchbar.text,)));          
                },
                )
                  ],),
                  
                  for(Contactmessage message in this.contactslist.contactmessage)
                    if(message.userid == this.id && (message.contact == searchresult || searchresult == null) && this.contactslist.contactmessage.indexWhere((element) => element.docid == message.docid) == this.contactslist.contactmessage.lastIndexOf(message))
                      Padding(padding: EdgeInsets.all(20),child:
                        GestureDetector(child:
                          Row(children: <Widget>[
                            CircleAvatar(radius:35,backgroundColor:Color.fromRGBO(80,216,144,1),child:CircleAvatar(radius:30,backgroundColor:Color.fromRGBO(239,255,251,1),child:Icon(Icons.person,size: 60,color:Color.fromRGBO(80,216, 144,1)))),
                            SizedBox(width: 10), 
                            Column(crossAxisAlignment:CrossAxisAlignment.start,children:<Widget>[
                            Text(message.contact, style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            // Text('new message', style:TextStyle(fontWeight: FontWeight.bold))
                            ])
                          ],),
                        onTap:() {
                          //contactslist = Contactslist();
                          Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,contactslist: this.contactslist,newmsg:this.newmsg,docid: message.docid,)));
                        }
                        ),
                      ),  
            ]
                ),
              ),
          ]
            )
            )
          ), ),
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,contactslist: this.contactslist,newmsg: this.newmsg,)));    
              } 
              if(value == 1)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,contactslist: this.contactslist,newmsg: this.newmsg)));          
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
                // data = new MyData(data.email,data.pwd);
                int id = this.id;
                UserList userList = this.userList;
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: user,id:id,userList:userList,apptlist:apptlist)));            

              }
              },
          ),
        );

  }
}

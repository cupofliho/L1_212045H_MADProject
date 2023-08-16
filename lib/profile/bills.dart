import 'dart:ui';
import 'package:projv3/profile/profileedit.dart';

import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import '../message/message.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
class Appt{
  int id;
  String date;
  String price;
  String status;
  Appt({this.id,this.date,this.price,this.status});
}
class ApptList{
  List<Appt> appts = [];
   void addappt(int id,String date,String price, String status) {
    Appt newappt = Appt(id: id,date: date, price: price,status: status);
    appts.add(newappt);
  }
  void updateUser(int id, String date,String price, String status)
  {
    appts[id] = Appt(id: id,date: date, price: price,status: status);
    
  }
}
class Bills extends StatelessWidget{
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
  Bills({Key key,this.email,this.apptlist,this.userList,this.user,this.id,this.newappt,this.loggedbefore,this.formattedDate,this.contactslist,this.newmsg}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child:
                  DefaultTextStyle(child:Text('Your bill history'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 30)),
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  SizedBox(height:20),
                  Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                    child:GestureDetector(
                      child:Padding(padding: EdgeInsets.all(15),
                        child:Row(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[DefaultTextStyle(child:Text('Bills'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                      ]),)
                    ),
                  ),
                  Container(
                    height: 360,
                    child: ListView(
                    children: <Widget>[
                      for (Appt savedappt in this.apptlist.appts)
                       if(savedappt.id == this.id)
                        ListTile(
                          title:
                          Expanded(child: Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                            child:GestureDetector(
                            child:Padding(padding: EdgeInsets.all(15),
                            child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                              DefaultTextStyle(child:Text(savedappt.date),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                              DefaultTextStyle(child:Text(savedappt.price),style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(79, 152, 202, 40),fontSize: 20)),
                              DefaultTextStyle(child:Text(savedappt.status),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.grey,fontSize: 20)),
                          ])
                        )
                      ),
                    ),)
                          
                        )
                    ],
                   
                  ))
                 
                   
                   

                    
                  ],
                 
                  // Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                  //   child:GestureDetector(
                  //     child:Padding(padding: EdgeInsets.all(15),
                  //       child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                  //         DefaultTextStyle(child:Text('20 Nov 2022'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                  //         DefaultTextStyle(child:Text('\$500.00'),style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(79, 152, 202, 40),fontSize: 20)),
                  //         DefaultTextStyle(child:Text(' paid '),style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(80, 216, 144, 40),fontSize: 20)),
                  //       ]))
                  //   ),
                  // ),
                  // Container(width:400,decoration: BoxDecoration(border:Border(bottom:BorderSide(width:4))),
                  //   child:GestureDetector(child:Padding(padding: EdgeInsets.all(15),
                  //     child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                  //         DefaultTextStyle(child:Text('10 Nov 2022'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 20)),
                  //         DefaultTextStyle(child:Text('\$500.00'),style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(79, 152, 202, 40),fontSize: 20)),
                  //         DefaultTextStyle(child:Text(' paid '),style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(80, 216, 144, 40),fontSize: 20)),
                  //       ]))
                  //   ),
                  // ),
                  
            // ],SizedBox(height:150)
            
            // ),
            //   ),
          ))]
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
                userList = UserList();
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg,contactslist:this.contactslist)));           
              } 
              if(value == 1)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg,contactslist:this.contactslist)));          

              }
              if (value == 2)
              {
                //MyData data = new MyData(data.email,data.pwd);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,loggedbefore: this.loggedbefore,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg:this.newmsg,contactslist:this.contactslist)));            

              }
              },
          ),
        );

  }
}

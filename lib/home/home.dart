import 'dart:ui';
import 'package:projv3/appointment/appointment.dart';
import 'package:projv3/profile/bills.dart';
import 'package:projv3/message/message.dart';
import 'package:projv3/appointment/prevbookappointment.dart';

import '../login/login.dart';
import '../profile/profile.dart';
import 'package:flutter/material.dart';
import '../login/register.dart';
import '../profile/bills.dart';

/*class MyData{
  final String email;
  final String password;
  MyData(this.email,this.password);
}*/
class Home extends StatefulWidget{
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
  Home({Key key, @required this.user, this.id, this.userList,this.apptlist,this.newappt,this.email,this.formattedDate,this.loggedbefore,this.newmsg,this.contactslist}):super(key: key);  
  @override
  State<StatefulWidget> createState()=>HomePage();
}
class HomePage extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  DefaultTextStyle(child:Text('Welcome back!'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 25)),
                  DefaultTextStyle(child:Text(widget.user.name),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 25)),
                ]
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.white),child:Padding(padding: EdgeInsets.all(10),child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  DefaultTextStyle(child:Text('Reminders :'),style: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(79, 152, 202, 1),fontSize: 20)),
                  Padding(padding: EdgeInsets.fromLTRB(10,10,10,10),
                    child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
                      Container(
                        width: 120,
                        height:120,
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color:Color.fromRGBO(79, 152, 202, 1)),
                        child:Padding(padding: EdgeInsets.all(10),child:DefaultTextStyle(child:Text('Your next appointment is 20 Dec 2022 3pm'),style:TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold)))
                      ),
                      
                      Container(
                        width: 120,
                        height:120,
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color:Color.fromRGBO(79, 152, 202, 1)),
                        child:Padding(padding: EdgeInsets.all(10),child:DefaultTextStyle(child:Text('Take 3 antibiotic pills at 2.30pm'),style:TextStyle(color:Colors.white,fontSize: 15, fontWeight: FontWeight.bold)))
                      ),
                    ]
                    )
                  ),
                ]
                ),),
              ),
              GestureDetector(onTap:(){
                widget.apptlist = ApptList();
                if(widget.newappt == null){
                  widget.newappt = true;
                }
                if(widget.newappt == true)
                {
                  widget.apptlist.addappt(1, '30 Nov 2022', '\$350.00', 'paid');
                  widget.apptlist.addappt(1, '20 Nov 2022', '\$500.00', 'paid');
                  widget.apptlist.addappt(1, '10 Nov 2022', '\$500.00', 'paid');
                  widget.apptlist.addappt(2, '15 Nov 2022', '\$100.00', 'paid');
                  widget.newappt = false;
                }
                Navigator.push(context,MaterialPageRoute(builder: (context) => Appointment(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,loggedbefore: this.widget.loggedbefore)));          

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
                widget.apptlist = ApptList();
                if(widget.newappt == null){
                  widget.newappt = true;
                }
                if(widget.newappt == true)
                {
                  widget.apptlist.addappt(1, '30 Nov 2022', '\$350.00', 'paid');
                  widget.apptlist.addappt(1, '20 Nov 2022', '\$500.00', 'paid');
                  widget.apptlist.addappt(1, '10 Nov 2022', '\$500.00', 'paid');
                  widget.apptlist.addappt(2, '15 Nov 2022', '\$100.00', 'paid');
                    widget.newappt = false;
                }
               
                 Navigator.push(context,MaterialPageRoute(builder: (context) => PrevBkAppt(user: widget.user,id:widget.id,userList:widget.userList,apptlist:widget.apptlist)));          

              },child:Padding(
                padding: EdgeInsets.only(top: 15),
                child:Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Color.fromRGBO(79, 152, 202, 1)),
                  child:Center(
                    child:Padding(padding: EdgeInsets.all(20),
                      child:DefaultTextStyle(child:Text('View Previous Appointments >'),style: TextStyle(fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),)
                    )
                  )
                )
              ),
              ),
              GestureDetector(child: Padding(
                padding: EdgeInsets.only(top: 15),
                child:Container(width: 400,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:Color.fromRGBO(80, 216, 144, 1)),
                  child:Center(
                    child:Padding(padding: EdgeInsets.all(20),
                      child:DefaultTextStyle(child:Text("Doctor's notes >"),style: TextStyle(fontSize: 20, color:Colors.white,fontWeight: FontWeight.bold),)
                    ),
                    
                    )
             
                  )
                ),onTap: () {                Navigator.push(context, MaterialPageRoute(builder: (context) => PrevBkAppt(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList, newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist)));
},
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
              } 
              if(value == 1)
              {
                print(widget.newmsg);
                print('nawh');
                 if(widget.newmsg == null){
                  print('agn');                widget.contactslist = Contactslist();

                  widget.newmsg = true;
                }
                if(widget.newmsg == true)
                {
                  print('idk');
                  widget.contactslist.addMessage(2,1,1, 'Dr Lee', 'Doctor, I feel something off after eating the medicine');
                  widget.contactslist.addMessage(1,1,1, 'Dr Lee', 'May I ask you to describe how you feel ?');
                  widget.contactslist.addMessage(2,1,2, 'Dr Kong', 'Tell me if you are not feeling where from medicine');
                  widget.contactslist.addMessage(2,0,2, 'Dr Kong', 'Can you send in the X-ray');
                  widget.newmsg = false;
                }
                print(widget.contactslist.contactmessage.length);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,newmsg:this.widget.newmsg)));          
              }
              if (value == 2)
              {                  
                widget.apptlist = ApptList();
                 if(widget.newappt == null){
                  widget.newappt = true;
                }
                if(widget.newappt == true)
                {
                  widget.apptlist.addappt(1, '30 Nov 2022', '\$350.00', 'paid');
                  widget.apptlist.addappt(1, '20 Nov 2022', '\$500.00', 'paid');
                  widget.apptlist.addappt(1, '10 Nov 2022', '\$500.00', 'paid');
                  widget.apptlist.addappt(2, '15 Nov 2022', '\$100.00', 'paid');
                  widget.newappt = false;
                }
                //User user;
                // data = new MyData(widget.data.email,widget.data.pwd);
                int id = widget.id;
                UserList userList = widget.userList;
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: widget.user,id:id,userList:userList,apptlist:widget.apptlist,newmsg: this.widget.newmsg,contactslist: this.widget.contactslist,)));            

              }
              },
          ),
        );

  }
}

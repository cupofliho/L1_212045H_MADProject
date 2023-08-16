import 'dart:ui';
import 'package:projv3/profile/aboutus.dart';
import 'package:projv3/profile/profileedit.dart';
import 'dart:async';
import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import '../profile/bills.dart';
import '../profile/aboutus.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../message/message.dart';
import '../profile/profile.dart';
class BkAppt extends StatefulWidget {
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
  BkAppt({Key key, this.user, this.id,this.apptlist,this.userList,this.newappt,this.loggedbefore,this.email,this.formattedDate,this.newmsg,this.contactslist}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookAppointment();
  }
}

class BookAppointment extends State<BkAppt>{
TextEditingController dateInput = TextEditingController();

@override
void initState(){
  dateInput.text="";
  super.initState();
}
 
bool input;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(width: 450,color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  DefaultTextStyle(child:Text('Book an'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 40)),
                  DefaultTextStyle(child:Text('Appointment'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 40)),
                ]
              ),
              Container(width:400,height:400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.white),child:Padding(padding: EdgeInsets.all(20),child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[

                  SizedBox(height:20),
                  Column(children: <Widget>[
                    TextField(
                      controller: dateInput, //editing controller of this TextField
                      decoration: InputDecoration( 
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                        );
                        if(pickedDate != null ){
                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          widget.formattedDate = DateFormat('dd-MMMM-yyyy').format(pickedDate); 
                          // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text = widget.formattedDate; //set output date to TextField value. 
                          });
                          input = true;
                        }
                        else{
                          input = false;  
                        }
                      },
                    ),
                    SizedBox(width: 180,height: 10,),
                   // Container(margin: EdgeInsets.only(top:20),child: Text('Available sessions:',style:TextStyle(fontWeight: FontWeight.bold))),
                    RaisedButton(child:Text('Confirm date'),onPressed:(){
                      if(input == true)
                      {
                        //widget.apptList = ApptList();
                        widget.apptlist.addappt(this.widget.id,this.widget.formattedDate , '-', '-');
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Bills(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg: this.widget.newmsg,contactslist: this.widget.contactslist,)));
                      }
                    } )
                ]
                ),]),
              ),
              
          )]
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg: this.widget.newmsg,contactslist: this.widget.contactslist,)));           
              } 
              if(value == 1)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg: this.widget.newmsg,contactslist: this.widget.contactslist,)));          

              }
              if (value == 2)
              {
                //MyData data = new MyData(widget.data.email,widget.data.pwd);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,newmsg: this.widget.newmsg,contactslist: this.widget.contactslist,)));            

              }
              },
          ),
        );


  }
}

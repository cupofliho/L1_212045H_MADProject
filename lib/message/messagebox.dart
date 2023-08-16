import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:projv3/profile/profileedit.dart';

import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import '../profile/bills.dart';
import 'package:flutter/material.dart';
import 'message.dart';
import '../profile/profile.dart';
bool checkmsgid(int id)
{
  if(id == 1)
  {
    return true;
  }
  else{
    return false;
  }
}

class MessageBox extends StatefulWidget{
  /*final MyData data;
  Bills({Key key,@required this.data}):super(key: key);*/
  Contactmessage message;
  Contactslist contactslist;
  ApptList apptlist;
  UserList userList;
  Appt appt;
  User user;
  int id; 
  int docid;
  bool newappt;
  bool loggedbefore;
  bool newmsg;
  String email;
  String formattedDate;
  final newmesage = TextEditingController() ;
  String msgname;
  MessageBox({Key key, this.apptlist,this.userList,this.user,this.id,this.newappt,this.loggedbefore,this.email,this.formattedDate,this.contactslist,this.newmsg,this.docid}):super (key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Newmewssagebox();
  }
}
class Newmewssagebox extends State<MessageBox>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    for(Contactmessage message in this.widget.contactslist.contactmessage)
      if(message.docid == this.widget.docid && this.widget.contactslist.contactmessage.indexWhere((element) => element.docid == message.docid) == this.widget.contactslist.contactmessage.lastIndexOf(message))
        this.widget.msgname = message.contact; 
        return Scaffold(
          appBar:AppBar(),
          body: SingleChildScrollView(child:Container(color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                CircleAvatar(radius:35,backgroundColor:Color.fromRGBO(80,216,144,1),child:CircleAvatar(radius:30,backgroundColor:Color.fromRGBO(239,255,251,1),child:Icon(Icons.person,size: 60,color:Color.fromRGBO(80,216, 144,1)))),
                Container(child:
                  DefaultTextStyle(child:Text(widget.msgname),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 30)),
                ),
                SizedBox(width: 60),
                Icon(Icons.phone,color: Color.fromRGBO(80,216,144,1),size: 40),
              ],),
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),child:Padding(padding: EdgeInsets.all(10),child:Expanded(child:SizedBox(height: 400,child:ListView(
                children:[
                    for(Contactmessage message in this.widget.contactslist.contactmessage) 
                      if(message.docid == this.widget.docid)
                        checkmsgid(message.id) ? 
                        ListTile(title:Container(width:300,child:
                          Row(mainAxisAlignment:MainAxisAlignment.end,children: <Widget>[
                            SizedBox(width:10),
                            Container(width:200,decoration: BoxDecoration(color: Color.fromRGBO(239, 255, 251,1),borderRadius:BorderRadius.circular(20)),child: Padding(padding: EdgeInsets.all(10),child:Text(message.message,style: TextStyle(color: Color.fromRGBO(80,216,144,1),fontSize: 18,fontWeight: FontWeight.bold),))),
                            SizedBox(height:20)
                          ],),
                        ) )
                        :
                        //  }
                      // else if(message.id==2){
                        ListTile(title:Container(width:300,child:
                        Row(mainAxisAlignment:MainAxisAlignment.start,children: <Widget>[
                        SizedBox(width:10),
                        Container(width:200,decoration: BoxDecoration(color: Color.fromRGBO(80,216,144,1),borderRadius:BorderRadius.circular(20)),child: Padding(padding: EdgeInsets.all(10),child:Text(message.message,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))),
                        SizedBox(height:20)
                        ],),
                        ),)
                ]
                ),)),)
              ),
              Row(children: <Widget>[
                Container(width:300,decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),border: Border.all(color: Color.fromRGBO(80,216,144,1),width: 5,)),child:TextField(controller:widget.newmesage,decoration: InputDecoration(border: InputBorder.none,hintText: 'Enter your text',hintStyle: TextStyle(fontSize:18 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(80,216,144,1,)))) ),
                GestureDetector(child:Padding(padding: EdgeInsets.all(10),child:Icon(Icons.send,size: 30,color: Color.fromRGBO(80,216,144,1))),
                onTap:() {
                  widget.contactslist.addMessage(1, this.widget.id, this.widget.docid,this.widget.msgname, this.widget.newmesage.text);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,newmsg:this.widget.newmsg,docid: this.widget.docid,)));
                },
                )
                
              ],)
              
              
              ]
            )
            )
          ),),
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,newmsg: this.widget.newmsg,)));           
              } 
              if(value == 1)
              {
                // Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate)));          

              }
              if (value == 2)
              {
                //MyData data = new MyData(widget.data.email,widget.data.pwd);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate,contactslist: this.widget.contactslist,newmsg: this.widget.newmsg,)));            

              }
              },
          ),
        );

  }
}
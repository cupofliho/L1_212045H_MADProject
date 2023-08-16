import 'dart:ui';
import 'package:projv3/profile/profile.dart';
import 'package:projv3/profile/profileedit.dart';
import 'package:url_launcher/url_launcher.dart';
import'../login/login.dart';
import '../home/home.dart';
import '../main.dart';
import 'bills.dart';
import 'package:flutter/material.dart';
import '../message/message.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
class AboutUs extends StatelessWidget{
  /*final MyData data;
  Bills({Key key,@required this.data}):super(key: key);*/
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
  AboutUs({Key key, @required this.email,this.apptlist,this.userList,this.user,this.id,this.newappt,this.loggedbefore,this.formattedDate,this.newmsg,this.contactslist}): super(key:key);
  Future<void> sendEmail() async {
    final MailOptions mailOptions = MailOptions(
      subject: 'Contact us !',
      recipients: ['feedback@moh.gov.sg'],
      // body: feedbackController.text,
      isHTML: false,
    );
    await FlutterMailer.send(mailOptions);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
          appBar:AppBar(),
          body: Container(color:Color.fromRGBO(239, 255, 251,1),child:Padding(padding: EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child:
                  DefaultTextStyle(child:Text('About Us'),style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 30)),
              ),
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.white),child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  SizedBox(height:20),
                  Container(width:400,
                      child:Padding(padding: EdgeInsets.all(15),
                        child:Column(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
                          Container(width: 150,child:Image(image: AssetImage('images/logo.png'))),
                          SizedBox(height:20),
                          RichText(text:TextSpan(text:'Guadian Doctor pledges to bring you \n\ closer to your doctor. Guardian Doctor\n\ is hassle-free and useful,a must-have \n\ for your health.',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize: 18))),
                      ]),)
                  ), 
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
                    // Container(child:)
                    InkWell(onTap: () =>sendEmail(),
                    child:Text('come talk to us'),
                    ),TextButton(
                        onPressed: () async {
                          var url = "tel:+65 12345678";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text('+65 12345678')),
                      ],)
                  
                // GestureDetector(child:Text('email us'))
                ],
             

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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList,newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg: this.newmsg,contactslist:this.contactslist)));
              } 
              if(value == 1)
              {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Message(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList, newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg: this.newmsg,contactslist: this.contactslist,)));          

              }
              if (value == 2)
              {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  Profile(user: this.user,id: this.id,apptlist: this.apptlist,userList: this.userList, newappt: this.newappt,email: this.email,formattedDate: this.formattedDate,newmsg: this.newmsg,contactslist: this.contactslist,)));            

              }
              },
          ),
        );

  }
}

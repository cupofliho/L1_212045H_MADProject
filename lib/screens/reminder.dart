import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/screens/appointment.dart';
import 'package:firebase_firestoreapp/screens/bookappointment.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/card.dart';
import 'package:firebase_firestoreapp/screens/message.dart';
import 'package:firebase_firestoreapp/screens/account.dart';
import 'package:firebase_firestoreapp/model/reminders.dart';
import 'package:firebase_firestoreapp/screens/reminder.dart';
import 'package:firebase_firestoreapp/services/firebaseauth_service.dart';
class Reminders extends StatefulWidget {
  final String userid;

  Reminders({Key key, this.userid}) : super(key: key);

  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  final TextEditingController edit = TextEditingController();
  final TextEditingController add = TextEditingController();

  Future<void> editReminder(reminderid,userid,reminder) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Padding(padding:EdgeInsets.all(25),child:SimpleDialog(
        // title: Text('What would you like to change ur name till ?'),
        children: <Widget>[
          TextField(
            controller: edit,
            decoration: InputDecoration(hintText: reminder),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            
                        InkResponse(
              onTap: () {

                print(reminderid+"this is editing" + userid + reminder);
                FirestoreService().updateReminder(reminderid,userid, edit.text);
                setState(() {
                  Navigator.pop(context);
                });
              },
              splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:Container(
                width:60,
                height: 30,
                      decoration: BoxDecoration(
                          gradient: purpleGradient,
                          borderRadius: BorderRadius.circular(5)),                
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('Update',style: TextStyle(color: Colors.white),)

                          ],)
              )
            ),
            InkResponse(
              onTap: () {
                setState(() {
                Navigator.pop(context);
              });
              },
              splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:Container(
                width:60,
                height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),                
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('Cancel',style: TextStyle(color: Colors.grey),)

                          ],)
              )
            ),
          
          ],)
               ],
      ));
    },
  );
}

Future<void> addReminder(userid) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Padding(padding:EdgeInsets.all(25),child:SimpleDialog(
        // title: Text('What would you like to change ur name till ?'),
        children: <Widget>[
          TextField(
            controller: add,
            decoration: InputDecoration(hintText: "add new reminder"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            
                        InkResponse(
              onTap: () {

                // print(reminderid+"this is editing" + userid + reminder);
                
                  Navigator.pop(context);
                  FirestoreService().addReminder(userid, add.text);

                
              },
              splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:Container(
                width:60,
                height: 30,
                      decoration: BoxDecoration(
                          gradient: purpleGradient,
                          borderRadius: BorderRadius.circular(5)),                
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('Add',style: TextStyle(color: Colors.white),)

                          ],)
              )
            ),
            InkResponse(
              onTap: () {
                setState(() {
                Navigator.pop(context);
              });
              },
              splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:Container(
                width:60,
                height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),                
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Text('Cancel',style: TextStyle(color: Colors.grey),)

                          ],)
              )
            ),
          
          ],)
               ],
      ));
    },
  );
}

// Future<void> editEmail() async {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return SimpleDialog(
//         title: Text('What would you like to change your email to ?'),
//         children: <Widget>[
//           TextField(
//             controller: emailedit,
//             decoration: InputDecoration(hintText: "new email"),
//           ),
//           FlatButton(
//             color: Colors.red,
//             textColor: Colors.white,
//             child: Text('CANCEL'),
//             onPressed: () {
//               setState(() {
//                 Navigator.pop(context);
//               });
//             }
//           ),

//           FlatButton(
//             color: Colors.green,
//             textColor: Colors.white,
//             child: Text('OK'),
//             onPressed: () {
//               if(emailedit.text != null)
//               {
//                 setState(() {
//                 widget.user.email = emailedit.text;
//                 Navigator.pop(context);
//               });
//               }
//                 },
//               ),        ],
//       );
//     },
//   );
// }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

        return Scaffold(
          backgroundColor: Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Stack(
                  alignment: AlignmentDirectional.topCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          gradient: purpleGradient,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Reminders',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          
                        ],
                      ),
                    ),
          
                  ]),
                   Container(width: 550,height: 500,
                  child:FutureBuilder<List<Reminder>>(
                    future: FirestoreService().readReminder(),
                    builder: (context,snapshot){
                      if(snapshot.hasData)
                      {
                        return ListView.builder(                          
                          itemCount: snapshot.data.length,
                          itemBuilder: 
                            (context,index)
                            {
                              if(snapshot.data[index].userId == widget.userid)
                              {
                                return  
                              GestureDetector(onTap: (){
                                print(snapshot.data[index].userId);
                                print(snapshot.data[index].reminder);
                                print(snapshot.data[index].reminderId);
                                editReminder(snapshot.data[index].reminderId,snapshot.data[index].userId,snapshot.data[index].reminder);
                              },child:Container(
                                margin: EdgeInsets.all(15),
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    color:Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1.0,
                                    blurRadius: 6.0
                                  )],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                              child:Padding(padding:EdgeInsets.all(10),child:Text(snapshot.data[index].reminder,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,),))
                              ));
                              }
                              else{
                                return Text('');
                              }
                              
                              
                            }
                        );
                      }
                    }
                    )
                  ),
          ],
        )
      ),
            bottomNavigationBar: Container(
              color:Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.home,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            GestureDetector(
              child: Icon(
                Icons.message,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: () {
                print(widget.userid);
                Navigator.push(context,MaterialPageRoute(builder: (context) => MessagePage(userid: widget.userid)));}
            ),
            GestureDetector(
              child: Icon(
                Icons.person,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: () {
                print(widget.userid);
                Navigator.push(context,MaterialPageRoute(builder: (context) => Profile(userid:widget.userid)));}
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Color(0xFFBF4954),
        ),
        backgroundColor: Colors.white,
        // tooltip: 'Sign Out',
        onPressed: () async {
          addReminder(widget.userid);
        },
      ),
        );

  }
}

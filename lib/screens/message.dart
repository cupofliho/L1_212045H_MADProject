import 'package:firebase_firestoreapp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/screens/messagebox.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:firebase_firestoreapp/screens/account.dart';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/model/message.dart';

class MessagePage extends StatefulWidget {
  final String userid;

  MessagePage({Key key, this.userid}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessagePage> {
  final TextEditingController searchbar = TextEditingController();
  Future<List<Map<String, dynamic>>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() async {
    _usersFuture = FirestoreService().getUsersByMessage(widget.userid);
  }
  String searchuser = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(239, 255, 251, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.topCenter,
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: purpleGradient,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Messages',
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
                  Positioned(
                    bottom: 15,
                    child: Row(children: <Widget>[
                      Container(
                        width: 300,
                        child: TextField(
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,
),
                          controller: searchbar,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.send,
                                size: 30, color: Colors.purpleAccent)),
                        onTap: () {
                          String input = searchbar.text;
                          print("below is user");
                          print(widget.userid);
                          setState(() {
                            searchuser = input;

                          });

                          // FirestoreService().readMessageData();
                          FirestoreService().getMessagesByUserid(widget.userid);
                          // FirestoreService().getUsersByMessage(widget.userid);
                        },
                      )
                    ]),
                  ),
                ],
              ),
              Container(
                width:400,
                height: 500,
                  child: FutureBuilder<List<User>>(
                      future: FirestoreService().readUserData(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData)
                        {

                          print("this has data");
                          print(snapshot.data.length);
                          
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context,index){

                              if(snapshot.data[index].role == 'doctor' ){  
                                if(searchuser != "")
                                {
                                  if(snapshot.data[index].fname == searchuser )
                                  {
                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical:14.0,horizontal:18.0),
                                      margin: EdgeInsets.only(bottom: 20,),
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [BoxShadow(
                                          color:Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1.0,
                                          blurRadius: 6.0
                                        )]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(backgroundColor: Color(0xFFD9D9D9),backgroundImage: AssetImage(snapshot.data[index].profilepic),radius:36.0),
                                          GestureDetector(
                                            onTap: (){
                                                                                            print(snapshot.data[index].userID+"sending this as me " + widget.userid);

                                              Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(userid:widget.userid,contactid: snapshot.data[index].userID)));
                                            },
                                          child:Container(
                                            height: 70,
                                            width: 170,
                                            child:Column(
                                              mainAxisAlignment:MainAxisAlignment.center,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text('Dr ' + snapshot.data[index].fname,
                                                style:
                                                  TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ]
                                            )
                                          )
                                          )
                                        ],
                                      )
                                    );
                                  }
                                  else{
                                    return 
                                    Text('');
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [                                    
                                    //   Text("there is no one by the name of " + searchuser + " in your contacts")
                                    // ],);
                                  }
                                }
                                else{
                                  return Container(
                                  padding: EdgeInsets.symmetric(vertical:14.0,horizontal:18.0),
                                  margin: EdgeInsets.only(bottom: 20,),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [BoxShadow(
                                      color:Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1.0,
                                      blurRadius: 6.0
                                    )]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CircleAvatar(backgroundColor: Color(0xFFD9D9D9),backgroundImage: AssetImage(snapshot.data[index].profilepic),radius:36.0),
                                      GestureDetector(
                                        onTap: (){
                                          print(snapshot.data[index].userID+"sending this as me " + widget.userid);
                                          Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(userid:widget.userid,contactid: snapshot.data[index].userID)));
                                        },
                                        child:Container(
                                          height: 70,
                                          width: 170,
                                          child:Column(
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text('Dr ' + snapshot.data[index].fname,
                                              style:
                                                TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ]
                                          )
                                        )
                                      )
                                    ],
                                  )
                                );
                              }
                                
                              }
                              else{
                                  if(searchuser != "")
                                {
                                  if(snapshot.data[index].userID != widget.userid && snapshot.data[index].fname == searchuser)
                                  {
                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical:14.0,horizontal:18.0),
                                      margin: EdgeInsets.only(bottom: 20,),
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [BoxShadow(
                                          color:Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1.0,
                                          blurRadius: 6.0
                                        )]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(backgroundColor: Color(0xFFD9D9D9),backgroundImage: AssetImage(snapshot.data[index].profilepic),radius:36.0),
                                          GestureDetector(
                                            onTap: (){
                                              print(snapshot.data[index].userID+"sending this as me " + widget.userid);
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(userid:widget.userid,contactid: snapshot.data[index].userID)));
                                            },
                                          child:Container(
                                            height: 70,
                                            width: 170,
                                            child:Column(
                                              mainAxisAlignment:MainAxisAlignment.center,
                                              crossAxisAlignment:CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(snapshot.data[index].fname,
                                                style:
                                                  TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ]
                                            )
                                          )
                                          )
                                        ],
                                      )
                                    );
                                  }
                                  else{
                                    return 
                                      Text('');

                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [                                    
                                    //   Text("there is no one by the name of " + searchuser + " in your contacts")
                                    // ],);
                                  }
                                }
                                else{
                                  if(snapshot.data[index].userID != widget.userid)
                                  {
                                    return Container(
                                      padding: EdgeInsets.symmetric(vertical:14.0,horizontal:18.0),
                                      margin: EdgeInsets.only(bottom: 20,),
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [BoxShadow(
                                          color:Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1.0,
                                          blurRadius: 6.0
                                        )]
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(backgroundColor: Color(0xFFD9D9D9),backgroundImage: AssetImage(snapshot.data[index].profilepic),radius:36.0),
                                          GestureDetector(
                                            onTap: (){
                                              print(snapshot.data[index].userID+"sending this as me " + widget.userid);
                                              Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(userid:widget.userid,contactid: snapshot.data[index].userID)));
                                            },
                                            child:Container(
                                              height: 70,
                                              width: 170,
                                              child:Column(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                crossAxisAlignment:CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(snapshot.data[index].fname,
                                                  style:
                                                    TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ]
                                              )
                                            )
                                          )
                                        ],
                                      )
                                    );
                                  }
                                  else{
                                    return 
                                      Text('');
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [                                    
                                    //   Text("there is no one by the name of " + searchuser + " in your contacts")
                                    // ],);
                                  }
                                  
                              }
                              }
                              
                            },
                            );
                        }
                        else{
                          print("no user data");
                        }
                      })),




              // Container(
              //     child: FutureBuilder<List<Message>>(
              //         future: FirestoreService().readMessageData(),
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData) {
              //             return ListView.builder(
              //                 itemCount: snapshot.data.length,
              //                 itemBuilder: (context, index) {
              //                   if (snapshot.data[index].sender == widget.userid) {
              //                     String contact = snapshot.data[index].receiver;
              //                     print(contact + "receiver id");
              //                     return Container(
              //                         child: FutureBuilder<List<User>>(
              //                           future: FirestoreService().readUserData(),
              //                           builder: (context, snapshot) {
              //                             return ListView.builder(
              //                               itemCount: snapshot.data.length,
              //                               itemBuilder: (context, index) {
              //                               if (snapshot.data[index].userID == contact) {
              //                               return Container(
              //                                 padding: EdgeInsets.symmetric(
              //                                   vertical: 14.0,
              //                                   horizontal: 18.0
              //                                 ),
              //                                 margin: EdgeInsets.only(bottom: 20.0,),
              //                                 decoration: BoxDecoration(
              //                                   color: Colors.white,
              //                                   borderRadius: BorderRadius.circular(12.0),
              //                                     boxShadow: [BoxShadow(
              //                                       color: Colors.grey.withOpacity(0.2),
              //                                       spreadRadius: 1.0,
              //                                       blurRadius: 6.0,
              //                                     ),]
              //                                 ),
              //                                 child: Row(
              //                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
              //                                   crossAxisAlignment:CrossAxisAlignment.start,
              //                                   children: <Widget>[
              //                                     Row(
              //                                       mainAxisAlignment:MainAxisAlignment.start,
              //                                       crossAxisAlignment:CrossAxisAlignment.start,
              //                                       children: <Widget>[
              //                                         CircleAvatar(backgroundColor:Color(0xFFD9D9D9),backgroundImage:NetworkImage(USER_IMAGE),radius: 36.0,),
              //                                         GestureDetector(
              //                                             onTap: () {
              //                                               Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(userid:widget.userid)));
              //                                             },
              //                                             child: Container(
              //                                                 height: 70,
              //                                                 width: 170,
              //                                                 child: Column(
              //                                                     mainAxisAlignment:MainAxisAlignment.center,
              //                                                     crossAxisAlignment:CrossAxisAlignment.center,
              //                                                     children: <Widget>[
              //                                                       Text(snapshot.data[index].fname,
              //                                                         style:
              //                                                             TextStyle(
              //                                                           color: Colors.black,
              //                                                           fontSize: 20,
              //                                                           fontWeight: FontWeight.w600,
              //                                                         ),
              //                                                       ),
              //                                                     ]
              //                                                 )
              //                                             )
              //                                         )
              //                                       ],
              //                                     ),
              //                                   ],
              //                                 ),
              //                               );
              //                             }
              //                           },
              //                         );
              //                       },
              //                     ));
              //                   } else if (snapshot.data[index].receiver == widget.userid) {
              //                     String contact = snapshot.data[index].sender;
              //                     print(contact + "receiver id");
              //                     return Container(child: FutureBuilder<List<User>>(
              //                       future:FirestoreService().readUserData(),
              //                       builder: (context,snapshot){
              //                         return ListView.builder(
              //                           itemCount: snapshot.data.length,
              //                           itemBuilder: (context,index){
              //                                    if (snapshot.data[index].userID ==contact){
              //                           return ListView.builder(
              //                             itemCount: snapshot.data.length,
              //                             itemBuilder: (context,index){
              //                               return Container(
              //                                 padding: EdgeInsets.symmetric(
              //                                     vertical: 14.0,
              //                                     horizontal: 18.0),
              //                                 margin: EdgeInsets.only(
              //                                   bottom: 20.0,
              //                                 ),
              //                                 decoration: BoxDecoration(
              //                                     color: Colors.white,
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             12.0),
              //                                     boxShadow: [
              //                                       BoxShadow(
              //                                         color: Colors.grey
              //                                             .withOpacity(0.2),
              //                                         spreadRadius: 1.0,
              //                                         blurRadius: 6.0,
              //                                       ),
              //                                     ]),
              //                                 child: Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment
              //                                           .spaceBetween,
              //                                   crossAxisAlignment:
              //                                       CrossAxisAlignment.start,
              //                                   children: <Widget>[
              //                                     Row(
              //                                       mainAxisAlignment:
              //                                           MainAxisAlignment.start,
              //                                       crossAxisAlignment:
              //                                           CrossAxisAlignment
              //                                               .start,
              //                                       children: <Widget>[
              //                                         CircleAvatar(
              //                                           backgroundColor:
              //                                               Color(0xFFD9D9D9),
              //                                           backgroundImage:
              //                                               NetworkImage(
              //                                                   USER_IMAGE),
              //                                           radius: 36.0,
              //                                         ),
              //                                         GestureDetector(
              //                                             onTap: () {
              //                                               Navigator.push(
              //                                                   context,
              //                                                   MaterialPageRoute(
              //                                                       builder: (context) =>
              //                                                           MessageBox(
              //                                                               userid:
              //                                                                   widget.userid)));
              //                                             },
              //                                             child: Container(
              //                                                 height: 70,
              //                                                 width: 170,
              //                                                 child: Column(
              //                                                     mainAxisAlignment:
              //                                                         MainAxisAlignment
              //                                                             .center,
              //                                                     crossAxisAlignment:
              //                                                         CrossAxisAlignment
              //                                                             .center,
              //                                                     children: <
              //                                                         Widget>[
              //                                                       Text(
              //                                                         snapshot
              //                                                             .data[
              //                                                                 index]
              //                                                             .fname,
              //                                                         style:
              //                                                             TextStyle(
              //                                                           color: Colors
              //                                                               .black,
              //                                                           fontSize:
              //                                                               20,
              //                                                           fontWeight:
              //                                                               FontWeight.w600,
              //                                                         ),
              //                                                       ),
              //                                                     ])))
              //                                       ],
              //                                     ),
              //                                   ],
              //                                 ),
              //                               );
              //                             },
              //                           );
              //                         }
              //                           });
                               
              //                       }
                                    
              //                       ));
              //                   }
              //                   else{
              //                     print('huh');
              //                   }
              //                 });
              //           }
              //         })),

              //   Container(
              //   padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
              //   margin: EdgeInsets.only(
              //     bottom: 20.0,
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(12.0),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.withOpacity(0.2),
              //           spreadRadius: 1.0,
              //           blurRadius: 6.0,
              //         ),
              //       ]),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           CircleAvatar(
              //             backgroundColor: Color(0xFFD9D9D9),
              //             backgroundImage: NetworkImage(USER_IMAGE),
              //             radius: 36.0,
              //           ),
              //           GestureDetector(
              //             onTap:(){
              //   Navigator.push(context,MaterialPageRoute(builder: (context) => MessageBox(userid:widget.userid)));
              //             },
              //             child: Container(height: 70,width: 170,child:
              //           Column(mainAxisAlignment:MainAxisAlignment.center,
              //           crossAxisAlignment:CrossAxisAlignment.center
              //           ,children: <Widget>[
              //             Text(
              //                       'Dr Ayor Kruger',
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 20,
              //                         fontWeight: FontWeight.w600,
              //                       ),
              //                     ),
              //           ])
              //           )
              //           )

              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
              onTap:(){ Navigator.pop(context);},
            ),
            GestureDetector(
              child: Icon(
                Icons.message,
                size: 30.0,
                color: Color(0xFFBF4954),
              ),
              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => MessagePage(userid: widget.userid)));

              },
            ),
            GestureDetector(
                child: Icon(
                  Icons.person,
                  size: 30.0,
                  color: Color(0xFFBF4954),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                }),
          ],
        ),
      ),
    );
  }}
import 'dart:ui';
import 'package:firebase_firestoreapp/color.dart';
import 'package:firebase_firestoreapp/screens/home_page.dart';
// import 'package:firebase_firestoreapp/screens/index.dart';
import 'package:firebase_firestoreapp/screens/message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_firestoreapp/services/firestore_service.dart';
import 'package:firebase_firestoreapp/model/user.dart';
class Profile extends StatefulWidget {
  String userid;    //

  Profile({Key key,this.userid}):super(key:key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _allergiesController = TextEditingController();
  String pic = userd;
  String newpic ;
  Future<void> changepfp(role,pic,userid)
  {
    List<String> profiles;
    
    print("changing profile pic" + role);
    if(role == 'doctor')
    {
      profiles = [doctorm,doctorw];
    }
    else{
      profiles = [userm,userw];
    }
    return showDialog(
      context: context,
      builder: (context){
        return Scaffold(
          body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Container(
          
          child: DefaultTextStyle(child:Text('pick your profile'), style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold))
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkResponse(
              onTap: (){
                  newpic = profiles[0];
                  Navigator.pop(context);
                  newpic = profiles[0];

              },
               splashColor: Colors.grey,
              highlightColor: Colors.grey,
              child:
              CircleAvatar(
                backgroundImage: AssetImage(profiles[0]),
                radius: 60,
              ),
            ),
            InkResponse(
               splashColor: Colors.grey,
              highlightColor: Colors.grey,
              onTap:(){
                  newpic = profiles[1];
                  Navigator.pop(context);
                  newpic = profiles[1];
              },
              child:  CircleAvatar(
          backgroundImage: AssetImage(profiles[1]),
          radius: 60,
        ) ,
            )
       
        ],),
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
        ],),
        );
        
        
        
      }

    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      body: SafeArea(
        child: Container(
          width: 500,
          height: 600,
          color: Color.fromRGBO(239, 255, 251, 1),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: 
            FutureBuilder<List<User>>(
              future:FirestoreService().readUserData(),
              builder:(context,snapshot){
                if(snapshot.hasData)
                {
                  var count = 0;
                print(snapshot.data.length);
                return ListView.builder(
                   itemCount: snapshot.data.length,
                  itemBuilder:(context,index){
                    print(count.toString()+ "checking:" + snapshot.data[index].userID);
                    if(widget.userid == snapshot.data[index].userID )
                    {
                      count+=1;
                      // pic = snapshot.data[index].profilepic;
                      return  Container(child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  changepfp(snapshot.data[index].role,snapshot.data[index].profilepic,widget.userid);
                                },
                                child: Container(
                                child: DefaultTextStyle(
                                  child: Text('Profile'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              )
                            
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(snapshot.data[index].profilepic),
                                radius: 60,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              labelText: snapshot.data[index].fname,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              labelText: snapshot.data[index].lname,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _allergiesController,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: snapshot.data[index].allegent,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          ElevatedButton(
                          onPressed: () {
                            setState(() {

                              String firstName = _firstNameController.text;                              
                              if(firstName == "")
                              {
                                firstName = snapshot.data[index].fname;
                              }
                            String lastName = _lastNameController.text;
                            if(lastName == "")
                              {
                                lastName = snapshot.data[index].lname;
                              }
                            String allergies = _allergiesController.text;    
                            if(allergies == "")
                              {
                                allergies = snapshot.data[index].allegent;
                              }
                            print("this is new pic" + pic);   
                            if(newpic != null)
                            {
                              FirestoreService().updateUserData(firstName, lastName, allergies, snapshot.data[index].role, widget.userid,newpic);

                            }       
                            else{
                              FirestoreService().updateUserData(firstName, lastName, allergies, snapshot.data[index].role, widget.userid,snapshot.data[index].profilepic);

                            }
                            });
                            // Handle Confirm Changes button press here
                            
                            // var userdata = FirestoreService().readUserData();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFBF4954),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Confirm Changes'),
                        ),
                        ],
                      ));
                    }
                    else{
                      count+=1;

                      print('oh no');
                      print(widget.userid);
                      return Text('');
                    }
                  }
                );
                }
                else{
                  print("no data");
                }
                
              }
            )
            
           
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
              onTap:(){ 
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(userid: widget.userid)));

              },
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Profile()));
                }),
          ],
        ),
      ),
    );
  }
}

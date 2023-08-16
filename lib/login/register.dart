import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projv3/home/home.dart';
import 'package:projv3/login/login.dart';
import '../home/home.dart';
import 'login.dart';
// import '';



class Register extends StatefulWidget{
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cnfrmpassword = TextEditingController();
  UserList userList;  
  User user;
  bool loggedbefore;
  Register({Key key,this.userList,this.user,this.loggedbefore}):super(key: key);
 
  State<StatefulWidget> createState() => RegisterState();
  }
class RegisterState extends State<Register>{
  bool errormsg = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar:AppBar(),body:SingleChildScrollView(child:Container(height:680,color:Color.fromRGBO(239, 255, 251,1), 
    child:Column(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
      Padding(padding: const EdgeInsets.all(20),child:Text('Login',style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Berlinsans' ),),),
       
      Padding(padding: const EdgeInsets.all(10),
        child: TextField(
          controller: widget.name,
          decoration: InputDecoration(
            hintText: 'Name',
            hintStyle: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(80, 216, 144, 1),fontFamily: 'Berlinsans'),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(79,152,202,1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20)),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(80, 216, 144, 1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        )
      ),
      Padding(padding: const EdgeInsets.all(10),
        child: TextField(
          controller: widget.email,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(80, 216, 144, 1),fontFamily: 'Berlinsans'),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(79,152,202,1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20)),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(80, 216, 144, 1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        )
      ),

      Padding(padding: const EdgeInsets.all(10),
        child: TextField(
          controller: widget.password,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(79,152,202,1),fontFamily: 'Berlinsans'),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(79,152,202,1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20)),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(80, 216, 144, 1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        )
      ),
       Padding(padding: const EdgeInsets.all(10),
        child: TextField(
          controller: widget.cnfrmpassword,
          decoration: InputDecoration(
            hintText: 'Retype Password',
            hintStyle: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(79,152,202,1),fontFamily: 'Berlinsans'),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(79,152,202,1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20)),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(80, 216, 144, 1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        )
      ),
      Padding(padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
        RaisedButton(onPressed: (){
          if( RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(widget.email.text) == true && widget.password.text.length > 8 && widget.password.text == widget.cnfrmpassword.text && widget.email.text != null && widget.password.text != null && widget.cnfrmpassword.text != null)
          {
            print(widget.loggedbefore);
            if(widget.loggedbefore != true)
                {
                  widget.userList = UserList();
                   widget.userList.addUser('Mary','mary@gmail.com', 'lol');
                widget.userList.addUser('Admin','admin@gmail.com', 'lol');
                  widget.loggedbefore = true;
                }
            User  tempuser = User(name:widget.name.text,email:widget.email.text,password:widget.password.text); 
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(user: tempuser,userList: this.widget.userList,loggedbefore: this.widget.loggedbefore,)));
          }
          else{
            setState(() {
              errormsg = true;
            });
            return Text("somthing's wrong");
          }
        }, textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text('Register'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),)
      ],)
      ), errormsg? Text('Invalid email or password',style: TextStyle(color: Colors.red),) : Text(""),

      
    ],
  ),

  ))       
);
  }
}
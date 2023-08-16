import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projv3/home/home.dart';
import 'package:projv3/message/message.dart';
import '../home/home.dart';
import 'register.dart';
import '../profile/bills.dart';
class User {
  String email;
  String password;
  String name;


  User({this.name,this.email, this.password});
}

class UserList {
  List<User> users = [];

  void addUser(String name,String email, String password) {
    User user = User(name: name,email: email, password: password);
    users.add(user);
  }
  void updateUser(int id, String name,String email,String password)
  {
    users[id] = User(name: name,email: email,password: password);
    
  }

  bool checkUser(String email, String password,int i) {
    // for (int i = 0; i < users.length; i++) {
      if (users[i].email == email && users[i].password == password) {
        return true;
      // }
    }
    return false;
  }
  bool forgotpassword(String email, String name){
    bool facts;
      for (int i = 0; i < users.length; i++) {
      if (users[i].email == email && users[i].name == name) {
        facts= true;
      }
      else{
        facts= false;
      }
    }
    return facts;
  }
}



class Login extends StatefulWidget{
   final emaillogin = TextEditingController();
  final passwordlogin = TextEditingController();
  Contactmessage message;
  Contactslist contactslist;
  ApptList apptlist;
  UserList userList;
  Appt appt;
  User user;
  int id; 
  bool newappt;
  bool loggedbefore;
  //String email;
  String formattedDate;
  String errormsg = "";



  Login({Key key,this.userList,this.user,this.loggedbefore}):super(key: key);
  final forgotpassword = TextEditingController();
  final forgotemail = TextEditingController();
  final forgotname = TextEditingController();
  final forgotcnfrmpassword = TextEditingController();

 State<StatefulWidget> createState() => LoginState(); 

}

class LoginState extends State<Login>{
   void forgotPassword(BuildContext context, UserList userList) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
        title: Text('Forgot Password'),
        children: <Widget>[
          TextField(
            controller: widget.forgotemail,
            decoration: InputDecoration(hintText: "your current email"),
          ),
          TextField(
            controller: widget.forgotname,
            decoration: InputDecoration(hintText: "your name"),
          ),
          TextField(
            controller: widget.forgotpassword,
            decoration: InputDecoration(hintText: "password"),
          ),
          TextField(
            controller: widget.forgotcnfrmpassword,
            decoration: InputDecoration(hintText: "forgot password"),
          ),
          GestureDetector(
            child: Container(decoration:BoxDecoration(color: Colors.red),child:Text('Update',style: TextStyle(color:Colors.white),)),
            onTap: () {
              print('pressed');
                if(widget.loggedbefore != true)
                {
                  widget.userList = UserList();
                   widget.userList.addUser('Mary','mary@gmail.com', 'lol');
                widget.userList.addUser('Admin','admin@gmail.com', 'lol');
                  widget.loggedbefore =true;
                }

              if(widget.forgotemail.text != null && widget.forgotemail.text != "" && widget.forgotname.text != null && widget.forgotname.text != "" && widget.forgotpassword.text != null && widget.forgotpassword.text != "" && widget.forgotcnfrmpassword.text != null && widget.forgotcnfrmpassword.text != "" && widget.forgotpassword.text == widget.forgotcnfrmpassword.text){
                  print('pressed0');
                  print(widget.forgotemail.text);
                  print(widget.forgotname.text);
                  print(widget.forgotpassword.text);
                  print(widget.forgotcnfrmpassword.text);
                  for (int i= 0;i<widget.userList.users.length;i++)
                  {

                    print('pressed2');
                    // print(widget.forgotemail.text);
                    // print(widget.forgotname.text);
                    // print(widget.forgotpassword.text);
                    // print(widget.forgotcnfrmpassword.text);
                    if(widget.userList.forgotpassword(widget.forgotemail.text,widget.forgotname.text) == true)
                    { 
                      print('pressed3');
                      // print(widget.forgotemail.text);
                      // print(widget.forgotname.text);
                      // print(widget.forgotpassword.text);
                      // print(widget.forgotcnfrmpassword.text);
                      // setState((){
                        widget.userList.updateUser(i, widget.forgotname.text, widget.forgotemail.text, widget.forgotpassword.text);
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => Login(user: this.widget.user,id: this.widget.id,apptlist: this.widget.apptlist,userList: this.widget.userList, newappt: this.widget.newappt,email: this.widget.email,formattedDate: this.widget.formattedDate)));
                        // Navigator.pop(context);
                      // });
                    }
                  }
              }

            }
          ),
          ],
        );
      },
    );
  }
    bool emailcheck = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar:AppBar(),body:SingleChildScrollView(child:Container(height:680,color:Color.fromRGBO(239, 255, 251,1), 
    child:Column(mainAxisAlignment:MainAxisAlignment.center,children: <Widget>[
      Padding(padding: const EdgeInsets.all(20),child:Text('Login',style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold,fontFamily: 'Berlinsans' ),),),

      Padding(padding: const EdgeInsets.all(10),
        child: TextField(
          controller: widget.emaillogin,
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
          controller: widget.passwordlogin,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(fontWeight:FontWeight.bold,color: Color.fromRGBO(80, 216, 144, 1),fontFamily: 'Berlinsans'),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(79,152,202,1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20)),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(80, 216, 144, 1),width: 7),borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        )
      ),
      //Container(if(invalid)),
      Padding(padding: const EdgeInsets.fromLTRB(20,5,20,0),
        child:Row(
          children: <Widget>[
            //if(emailcheck) Text('Invalid Email'),      
            InkWell(
            child: Text('Forgot password?',style: TextStyle(fontWeight: FontWeight.bold),),
            onTap: (){forgotPassword(context,widget.userList);}
            ),
            SizedBox(width:170),
            RaisedButton(
              onPressed: (){
                if(widget.loggedbefore != true)
                {
                  widget.userList = UserList();
                   widget.userList.addUser('Mary','mary@gmail.com', 'lol');
                widget.userList.addUser('Admin','admin@gmail.com', 'lol');
                  widget.loggedbefore = true;
                }
                if(widget.user != null)
                {
                  // int id = widget.userList.users.length;
                  widget.userList.addUser(widget.user.name,widget.user.email,widget.user.password);
                }

                //print(account.accounts.length);
                if(widget.emaillogin.text != null && widget.emaillogin.text != "" && widget.passwordlogin.text != null){
                  for (int i= 0;i<widget.userList.users.length;i++)
                  {
                    if(widget.userList.checkUser(widget.emaillogin.text,widget.passwordlogin.text,i) == true)
                    {
                      print(widget.loggedbefore);
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => Home(user:widget.userList.users[i],id: widget.userList.users[i].id,userList: widget.userList,loggedbefore: true,)));
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Home(id: i,user:widget.userList.users[i],userList: widget.userList,loggedbefore: true,)));

                    }
                    else{
                      setState((){
                        emailcheck = true;
                      });
                       //emailcheck == true? Text("invalid email"):Text('');
                      //Text(errormsg);
                      print('is it printing');
                      widget.errormsg = "cannot find email or wrong password";
                    }
                  //}
                  //print(userList.users.length);
                }
              }},
              textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text('Login'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ],
        )
      ),
      emailcheck? Text('Cannot find email or wrong password',style: TextStyle(color: Colors.red),) : Text(""),

      Container(width: 150, height:150,child:Image.asset('images/logo.png')),
      InkWell(
            child: Text('New here? Click to sign up',style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationThickness: 2,decorationColor: Colors.black),),
            onTap: () =>
              Navigator.push(context,MaterialPageRoute(builder: (context) => Register(loggedbefore: widget.loggedbefore,userList: widget.userList,)))
            ),
    ],
  )
  )));
  }
}

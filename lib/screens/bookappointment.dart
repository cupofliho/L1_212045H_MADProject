import 'dart:ui';import 'package:flutter/material.dart';


class BkAppt extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookingAppointment();
  }
}

class BookingAppointment extends State<BkAppt>{
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
                          // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
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
                      }
                    } )
                ]
                ),]),
              ),
              
          )]
            )
            )
          ),

        );


  }
}

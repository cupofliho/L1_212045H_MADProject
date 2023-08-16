import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_firestoreapp/model/user.dart';
import 'package:firebase_firestoreapp/model/message.dart';
import 'package:firebase_firestoreapp/model/reminders.dart';
import 'package:firebase_firestoreapp/model/appointment.dart';

class FirestoreService {
  // Create a CollectionReference called bookCollection that references
  // the firestore collection
  



CollectionReference userCollection =
    FirebaseFirestore.instance.collection('userDetail');

  Future<void> addUserData(String fname, String lname, String allegent,
      String role, String userID,String profilepic) async {
    var docRef = FirestoreService().userCollection.doc();
    print('add docRef: ' + docRef.id);
    await userCollection.doc(docRef.id).set({
      'FName': fname,
      'LName': lname,
      'allegent': allegent,
      'role': role,
      'userID': userID,
      'profilepic':profilepic
    });
  } //addBookData

  Future<List<User>> readUserData() async {
    List<User> userlist = [];
    QuerySnapshot snapshot = await userCollection.get();
    snapshot.docs.forEach((document) {
      User user = User.fromMap(document.data());
      userlist.add(user);
    });
    print('UserList: $userlist');
    return userlist;
  } //readBookData

  Future<DocumentSnapshot> getUserByUserId(String userId) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('userDetail') // Replace 'users' with your collection name
          .where('userID', isEqualTo: userId)
          .limit(1)
          .get();

      if (snapshot.size > 0) {
        return snapshot.docs.first;
      }
    } catch (e) {
      print('Error getting user document: $e');
    }

    return null; // If no matching document found, return null
  }

  // Future<void> deleteUserData(String docId) async {
  //   bookCollection.doc(docId).delete();
  //   print('deleting uid: ' + docId);
  // } //deleteBookData

  //for your reference
  Future<void> updateUserData(
    String fname,
    String lname,
    String allegent,
    String role,
    String userId,
    String profilepic
  ) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('userDetail') // Replace 'users' with your collection name
          .where('userID', isEqualTo: userId)
          .limit(1)
          .get();

      if (snapshot.size > 0) {
        String docId = snapshot.docs.first.id;
        print(docId);
        await FirebaseFirestore.instance
            .collection('userDetail')
            .doc(docId)
            .update({
          'FName': fname,
          'LName': lname,
          'allegent': allegent,
          'role': role,
          'userID': userId,
          'profilepic':profilepic
        });
        print('User data updated successfully.');
      } else {
        print('User not found or does not exist.');
      }
    } catch (e) {
      print('Error updating user data: $e');
    }
  }



CollectionReference messageCollection =
    FirebaseFirestore.instance.collection('messages');

Future<List<Message>> readMessageData() async {
  List<Message> messagelist = [];
  QuerySnapshot snapshot = await messageCollection.get();
  snapshot.docs.forEach((document) {
    Message message = Message.fromMap(document.data());
    messagelist.add(message);
  });
  print('MessageList: $messagelist');
  return messagelist;
}

Future<void> adduserMessage(String message, String userid, String receiverid) async {
  var docRef = FirestoreService().messageCollection.doc();
  await messageCollection.doc(docRef.id).set({
    'message':message,
    'receiver': receiverid,
    'sender': userid
  });
}

Future<List<Message>> getMessagesByUserid(String userId) async {
  try{
    QuerySnapshot receiverQuery = await FirebaseFirestore.instance
        .collection('messages')
        .where('receiver', isEqualTo: userId)
        .get();

    QuerySnapshot senderQuery = await FirebaseFirestore.instance
        .collection('messages')
        .where('sender', isEqualTo: userId)
        .get();
    print(receiverQuery);
    print(senderQuery);
    List<Message> messages = [];

    receiverQuery.docs.forEach((document) {
      Message message = Message.fromMap(document.data());
      messages.add(message);
    });

    senderQuery.docs.forEach((document) {
      Message message = Message.fromMap(document.data());
      messages.add(message);
    });

    if (messages.isEmpty) {
      // Return a default "no messages" message or an empty list
    print("there is no messages");

    return messages;
  }
  }
  catch(e)
  {
    print("message error");
    print(e);
    return (e);
  }
}


 Future<List<Map<String, dynamic>>> getUsersByMessage(String userId) async {
    try {
      // Fetch messages where the user is the sender
      QuerySnapshot senderQuerySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('sender', isEqualTo: userId)
          .get();

      // Fetch messages where the user is the receiver
      QuerySnapshot receiverQuerySnapshot = await FirebaseFirestore.instance
          .collection('messages')
          .where('receiver', isEqualTo: userId)
          .get();

      // Combine the results of both queries
      List<QueryDocumentSnapshot> allMessages = [
        ...senderQuerySnapshot.docs,
        ...receiverQuerySnapshot.docs,
      ];

      // Get unique user IDs from the messages
      List<String> userIds = [];
      allMessages.forEach((messageDoc) {
        String senderId = messageDoc.get('sender');
        String receiverId = messageDoc.get('receiver');
        if (senderId != null && !userIds.contains(senderId)) {
          userIds.add(senderId);
        }
        if (receiverId != null && !userIds.contains(receiverId)) {
          userIds.add(receiverId);
        }
      });

      // Fetch users from userdetails collection where userId is found in the unique user IDs
      QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
          .collection('userdetails')
          .where('userId', whereIn: userIds)
          .get();

      // Convert the QuerySnapshot to a List of Maps containing user details
      List<Map<String, dynamic>> users = usersSnapshot.docs
          .map((userDoc) => userDoc.data())
          .toList();

      print(users);
      return users;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  final CollectionReference reminderCollection = FirebaseFirestore.instance.collection('reminders');
  Future<void> addReminder(
 String userId, String reminder) async {
 var docRef = FirestoreService().reminderCollection.doc();
 print('add docRef: ' + docRef.id);
 await reminderCollection.doc(docRef.id).set({
 'reminderId': docRef.id,
 'userId': userId,
 'reminder': reminder
 });
 } //addBookData
 Future<List<Reminder>> readReminder() async {
 List<Reminder> reminderlist = [];
 QuerySnapshot snapshot = await reminderCollection.get();
snapshot.docs.forEach((document) {
 Reminder reminder = Reminder.fromMap(document.data());
 reminderlist.add(reminder);
 });
 print('ReminderList: $reminderlist');
 return reminderlist;
 }

 Future<void> updateReminder(String reminderId,
 String userId, String reminder) async {
// var docRef = FirestoreService().reminderCollection.doc();
//  print('update docRef: ' + docRef.id);
 await reminderCollection.doc(reminderId).update({
 'reminderId': reminderId,
  'userId' : userId,
 'reminder': reminder
 });
 } 


CollectionReference appointmentCollection =
    FirebaseFirestore.instance.collection('appointments');

  Future<void> addAppointment(String doctorid, String memberid, 
       String date,String time) async {
    var docRef = FirestoreService().appointmentCollection.doc();
    print('add docRef: ' + docRef.id);
    await appointmentCollection.doc(docRef.id).set({
      'appointmentid': docRef.id,
      'booked': 'false',
      'date': date,
      'doctorid': doctorid,
      'memberid': memberid,
      'paid':'false',
      'price':"",
      'time':time,
    });
  } //addBookData

  Future<List<Appointment>> readAppointmentData() async {
    List<Appointment> appointmentlist = [];
    QuerySnapshot snapshot = await appointmentCollection.get();
    snapshot.docs.forEach((document) {
      Appointment appointment = Appointment.fromMap(document.data());
      appointmentlist.add(appointment);
    });
    print('Appointmentlist: $appointmentlist');
    return appointmentlist;
  } //readBookData
 Future<void> updateAppointmentData(
  String appointmentid,
  String booked,
  String date,
  String doctorid,
  String memberid,
  String paid,
  String price,
  String time
  ) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('appointments') // Replace 'users' with your collection name
          .where('appointmentid', isEqualTo: appointmentid)
          .limit(1)
          .get();

      if (snapshot.size > 0) {
        String docId = snapshot.docs.first.id;
        print(docId);
        await FirebaseFirestore.instance
            .collection('appointments')
            .doc(docId)
            .update({
  'appointmentid': appointmentid,
 'booked': booked,
 'date': date,
 'doctorid': doctorid,
  'memberid': memberid,
 'paid': paid,
 'price': price,
  'time': time
        });
        print('Appointment data updated successfully.');
      } else {
        print('Appointment not found or does not exist.');
      }
    } catch (e) {
      print('Error updating appointment data: $e');
    }
  }
} //FirestoreService


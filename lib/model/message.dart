class Message {
  String message;
  String receiver;
  String sender;
  Message({this.message, this.receiver, this.sender});
  Message.fromMap(Map<String, dynamic> data) {
    message = data['message'];
    receiver = data['receiver'];
    sender = data['sender'];
  }
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'receiver': receiver,
      'sender': sender,
      
    };
  }
}

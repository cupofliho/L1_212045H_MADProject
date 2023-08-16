class Reminder {
  String reminderId;
 String userId;
 String reminder;
 Reminder({this.userId, this.reminder});
 Reminder.fromMap(Map<String, dynamic> data) {
  reminderId = data['reminderId'];
 userId = data['userId'];
 reminder = data['reminder'];
}
 Map<String, dynamic> toMap() {
 return {
  'reminderId' : reminderId,
 'userId': userId,
 'reminder': reminder
 };
 }
}

class Appointment {
  String appointmentid;
  String booked;
  String date;
  String doctorid;
  String memberid;
  String paid;
  String price;
  String time;

Appointment ({
  this.appointmentid,
  this.booked,
  this.date,
  this.doctorid,
  this.memberid,
  this.paid,
  this.price,
  this.time });
  Appointment.fromMap(Map<String, dynamic> data) {
  appointmentid = data['appointmentid'];
  booked = data['booked'];
  date = data['date'];
  doctorid = data['doctorid'];
  memberid = data['memberid'];
  paid = data['paid'];
  price = data['price'];
  time = data['time'];
 }
 Map<String, dynamic> toMap() {
 return {
 'appointmentid': appointmentid,
 'booked': booked,
 'date': date,
 'doctorid': doctorid,
  'memberid': memberid,
 'paid': paid,
 'price': price,
  'time': time
 };
 }
}
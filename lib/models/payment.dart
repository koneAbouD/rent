import 'package:cloud_firestore/cloud_firestore.dart';

class Payment{
  final int amount;
  final Timestamp date;
  final String modePaid;
  final Timestamp monthPaid;

  Payment({
    required this.amount,
    required this.date,
    required this.modePaid,
    required this.monthPaid
  });

  factory Payment.fromData(dynamic data){
    return Payment(amount: data['amount'], date: data['date'], modePaid: data['mode_paid'], monthPaid: data['month_paid']);
  }
}
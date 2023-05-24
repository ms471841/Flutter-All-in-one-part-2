import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dateFormat = DateFormat('MMM d, yyyy');
final timeFormat = DateFormat('h:mm a');

String formatTime(DateTime dateTime) {
  final timestamp = Timestamp.fromDate(dateTime);
  final dateStr = dateFormat.format(dateTime);
  final timeStr = timeFormat.format(dateTime);

  // return '$dateStr at $timeStr';
  return '$timeStr';
}
String formatDate(DateTime dateTime) {
  final timestamp = Timestamp.fromDate(dateTime);
  final dateStr = dateFormat.format(dateTime);
  final timeStr = timeFormat.format(dateTime);

   return '$dateStr';
 
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? subscriptionId;
  final bool isSubscribed;
  final double? subscriptionAmount;
  final DateTime? subscriptionStartDate;
  final DateTime? subscriptionEndDate;

  const MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.subscriptionId,
    this.isSubscribed = false,
    this.subscriptionAmount,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
  });

  @override
  

  List<Object?> get props => [
        id,
        name,
        email,
        photoUrl,
        subscriptionId,
        isSubscribed,
        subscriptionAmount,
        subscriptionStartDate,
        subscriptionEndDate,
      ];

  factory MyUser.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MyUser(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      photoUrl: data['photoUrl'],
      subscriptionId: data['subscriptionId'],
      isSubscribed: data['isSubscribed'] ?? false,
      subscriptionAmount: data['subscriptionAmount'],
      subscriptionStartDate: data['subscriptionStartDate'] != null
          ? (data['subscriptionStartDate'] as Timestamp).toDate()
          : null,
      subscriptionEndDate: data['subscriptionEndDate'] != null
          ? (data['subscriptionEndDate'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'subscriptionId': subscriptionId,
      'isSubscribed': isSubscribed,
      'subscriptionAmount': subscriptionAmount,
      'subscriptionStartDate': subscriptionStartDate != null
          ? Timestamp.fromDate(subscriptionStartDate!)
          : null,
      'subscriptionEndDate': subscriptionEndDate != null
          ? Timestamp.fromDate(subscriptionEndDate!)
          : null,
    };
  }
}

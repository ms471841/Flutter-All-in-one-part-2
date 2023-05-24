import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paymentint/data/models/user.dart';

class Database {
  // save user data when signin
  Future<void> saveUserData(MyUser user) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(user.id);
    await userRef.set(user.toFirestore());
  }

  // get user data

  Future<MyUser?> getUserData(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return MyUser.fromFirestore(snapshot);
  }

//get user by  id

  Future<MyUser?> findUserById(String userId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        // User document exists
        MyUser user = MyUser.fromFirestore(snapshot);
        return user;
      }
      // User document does not exist
      return null;
    } catch (e) {
      return null;
    }
  }

// update user amount
  Future<void> updatePaymentStatus(
      Subscription subscription, MyUser user) async {
    // Example: 30-day subscription period

    await firestore
        .collection('users')
        .doc(user.id)
        .collection('subscriptions')
        .doc(subscription.id)
        .set(subscription.toFirestore());
    await firestore.collection('users').doc(user.id).update({
      'subscriptionId': subscription.id,
      'isSubscribed': true,
      'subscriptionAmount': subscription.amount,
      'subscriptionStartDate': subscription.startDate,
      'subscriptionEndDate': subscription.startDate
    });
  }

  Future<MyUser> fetchUserWithSubscriptionDetails(String userId) async {
    final DocumentSnapshot userSnapshot =
        await firestore.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      final MyUser user = MyUser.fromFirestore(userSnapshot);

      final QuerySnapshot subscriptionSnapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('subscriptions')
          .get();

      final List<Subscription> subscriptions = subscriptionSnapshot.docs
          .map((subscriptionDoc) => Subscription.fromFirestore(subscriptionDoc))
          .toList();

      user.subscriptionHistory = subscriptions;

      return user;
    }

    throw Exception('User not found');
  }
}

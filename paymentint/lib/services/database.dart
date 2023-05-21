import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paymentint/data/models/user.dart';

class Database {
  // save user data when signin
  Future<void> saveUserData(String uid, MyUser user) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
    print(userRef);
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
      print('Error retrieving user: $e');
      return null;
    }
  }

// update user amount
  Future<void> updatePaymentStatus(
      String? orderId, String? paymentId, int selectedPlan) async {
    final startDate = DateTime.now();
    final endDate = startDate
        .add(const Duration(days: 30)); // Example: 30-day subscription period

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'subscriptionId': paymentId,
      'isSubscribed': true,
      'subscriptionAmount': selectedPlan,
      'subscriptionStartDate': startDate,
      'subscriptionEndDate': endDate,
    });
  }
}

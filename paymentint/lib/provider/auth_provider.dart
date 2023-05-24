import 'package:flutter/material.dart';
import 'package:paymentint/data/models/user.dart';
import 'package:paymentint/services/auth.dart';
import 'package:paymentint/services/database.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  final Database _database = Database();
  bool _isLoading = false;
  bool _isLogin = false;
  String? _errorMessage;
  MyUser? user;
  bool get isLogin => _isLogin;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Check if the user is logged in
  void isUserLoggedIn() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    // _isLogin = _authService.isUserLoggedIn();
    // user = (await _database.findUserById(userr!.uid))!;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> loginWithGoogle() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    _authService.signInWithGoogle().then((credential) async {
      // Login successful, update the state

      user = await _database.findUserById(credential!.uid);

      if (user == null) {
        final user = MyUser(
            id: credential.uid,
            name: credential.displayName,
            email: credential.email,
            photoUrl: credential.photoURL);

        _database.saveUserData(user);
      }
      _isLoading = false;
      notifyListeners();
    }).catchError((e) {
      // Handle error and update the state
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    });
  }

  Future<void> getUserData() async {
    _isLoading = true;
    _errorMessage = null;
    //notifyListeners();
    _authService.isUserLoggedIn().then((value) {
      user = value!;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> saveUserSubscription(
      String? orderId, String paymentId, int selectedPlan) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final startDate = DateTime.now();
    final endDate = startDate.add(const Duration(days: 30));
    final subscription = Subscription(
        id: paymentId,
        amount: selectedPlan,
        startDate: startDate,
        endDate: endDate);
    _database.updatePaymentStatus(subscription, user!);
    await getUserData();
    notifyListeners();
  }
}

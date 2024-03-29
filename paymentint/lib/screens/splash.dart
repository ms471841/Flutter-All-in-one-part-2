import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late bool islogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _getUser() async {
    final user = _auth.currentUser;
    islogin = user != null;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
    final page = islogin != null
        ? islogin
            ? '/home'
            : '/signup'
        : '/signup';
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text("Please Wait...")
          ],
        ),
      ),
    );
  }
}

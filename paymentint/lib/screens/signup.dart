import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paymentint/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<AuthProvider>(builder: (context, authProvider, _) {
        return Stack(
          children: [
            SignUpCard(),
            if (authProvider.isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            if (authProvider.errorMessage != null)
              Positioned.fill(
                child: Container(
                  color: Colors.black26,
                  child: Center(
                    child: Text(authProvider.errorMessage!),
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}

class SignUpCard extends StatefulWidget {
  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  bool _isSignIn = true;

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String _errorMessage = '';

  void _handleGoogleAuth() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return ElevatedButton(
            onPressed: () {
              authProvider.loginWithGoogle().then((_) {
              // Navigate to the home screen after successful sign-in
              Navigator.pushReplacementNamed(context, '/home');
            });
             
            },
            child: const Text('Sign In With Google'),
          );
        }),
      ),
    );
  }
}

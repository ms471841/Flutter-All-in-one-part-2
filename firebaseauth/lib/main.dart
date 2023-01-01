import 'package:firebaseauth/service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(RunMyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  String myemail = 'Null';
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: Text('Sign-Up')),
            ElevatedButton(
                onPressed: () {
                  signIn();
                },
                child: Text('Sign-In')),
            ElevatedButton(
                onPressed: () {
                  GetUser();
                },
                child: Text('Get user profile')),

                Text(myemail),
          ],
        ),
      ),
    );
  }
}

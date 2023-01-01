import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginforsharedprefrences/home.dart';
import 'package:loginforsharedprefrences/share.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
    home: myApp(),
    theme: ThemeData(primarySwatch: Colors.green, backgroundColor: Colors.greenAccent),
  ));
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  late bool userIsLoggedIn;

  getLoggedInState() async {
    await Helper.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value!;
      });
    }
    );
  }

  @override
  void initState() {
    super.initState();

    getLoggedInState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => userIsLoggedIn != null
                ? userIsLoggedIn
                    ? Home()
                    : Signin()
                : Signin()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Prefrences",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}

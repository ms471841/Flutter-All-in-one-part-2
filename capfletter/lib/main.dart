import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String myString = "hello world";
    String capitalizedString = myString.capitalize();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Capitalized the First letter of the string'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Original String - ${myString}',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              Text(
                'Capitalized String - ${capitalizedString}',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

import 'package:connectmongo/database.dart';
import 'package:flutter/material.dart';
import 'package:connectmongo/database.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  @override
  void initState() {
    // TODO: implement initState

    ConnectDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mongo Connection with Flutter",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mongo with Flutter"),
        ),
        body: Container(),
      ),
    );
  }
}

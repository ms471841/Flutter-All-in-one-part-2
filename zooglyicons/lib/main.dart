import 'package:flutter/material.dart';
import 'package:zoogly_icons/zoogly_icons.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Center(
          child: IconButton(
              icon: Icon(ZooglyIcons.app_recent_icon),
              onPressed: () {
                print("Pressed");
              }),
        ),
      ),
    );
  }
}

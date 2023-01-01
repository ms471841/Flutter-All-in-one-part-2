import 'package:flutter/material.dart';
import 'package:circularbox/circularbox.dart';

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
        appBar: AppBar(title: Text('Circular container '),),
        body: Center(
          child: CircularBox(
          child: Container(
            width:100,
            height:100,
            child: Text('Geeks for Geeks'),
            
            color: Colors.green,
          ),
          radius: 12,
      ),
        ),
       ),
    );
  }
}
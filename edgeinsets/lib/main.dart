import 'package:flutter/material.dart';

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
          title: Text('EdgeInsets class'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            height: 200,
            width: 200,
            child: Text('EdgeInsets fromLTRB'),
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

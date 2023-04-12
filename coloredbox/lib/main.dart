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
          title: Text('Colored Box Class'),
        ),
        body: Center(
          child: ColoredBox(
            color: Colors.green,
            child: Text('Colored Box'),
          ),
        ),
      ),
    );
  }
}

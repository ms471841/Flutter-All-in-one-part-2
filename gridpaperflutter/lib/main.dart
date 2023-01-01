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
          title: Text('Grid Paper'),
        ),
        body: GridPaper(
          color: Color.fromARGB(255, 60, 138, 62),
          divisions: 2,
          subdivisions: 2,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 51, 248, 149),
          ),
        ),
      ),
    );
  }
}


stl
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text('Gradient Button'),),
        body: Center(
          child: Container(
            height: 120.0,
            decoration: BoxDecoration(
                 shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 2, 173, 102), Colors.blue])),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text('Elevated Button'),
            ),
          ),
        ),
      ),
    );
  }
}

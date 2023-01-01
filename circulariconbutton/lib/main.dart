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
          title: Text('Circular Icon Button'),
        ),
        body: Center(
          child: ElevatedButton( //elevated button
            onPressed: () {},
            child: Icon(Icons.menu, color: Colors.white), //icon of the button
            style: ElevatedButton.styleFrom( //styling the button
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Colors.green, //  Button color
              foregroundColor: Colors.cyan, // Splash color
            ),
          ),
        ),
      ),
    );
  }
}

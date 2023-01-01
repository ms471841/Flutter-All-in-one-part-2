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
          title: Text('Divider Widget'),
        ),
        body: Column(
          children: [
            Text('Divider'),
            Divider(
              height: 100,
              color: Colors.green,
              thickness: 1,
              indent: 20,
              endIndent: 20,
             
            ),
           
          ],
        ),
      ),
    );
  }
}

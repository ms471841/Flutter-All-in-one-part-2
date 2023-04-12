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
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Round the image'),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.all(8), // Border width
          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.asset('assets/gfglogo.png', fit: BoxFit.cover),
            ),
          ),
        )),
      ),
    );
  }
}

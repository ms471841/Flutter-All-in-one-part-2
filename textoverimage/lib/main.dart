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
    title: Text("Text Over Image"),
  ),
  body: Center(
    child: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/s2.png',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Text(
              'Text Over the Image',
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0),
            )),
      ],
    ),
  ),
) ,
    );
  }
}
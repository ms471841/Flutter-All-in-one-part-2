import 'package:flutter/material.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';

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
        appBar: AppBar(
          title: Text('Gradient Slide to Act'),
        ),
        body: Center(
          child: GradientSlideToAct(
            width: 400,
            textStyle: TextStyle(color: Colors.white, fontSize: 15),
            backgroundColor: Color.fromARGB(255, 23, 99, 29),
            onSubmit: () {
              debugPrint("Submitted!");
            },
            gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 13, 194, 28),
                  Color.fromARGB(255, 8, 87, 5),
                ]),
          ),
        ),
      ),
    );
  }
}

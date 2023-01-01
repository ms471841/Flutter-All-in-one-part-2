import 'package:flutter/material.dart';
import 'package:step_circle_progressbar/step_circle_progressbar.dart';

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
          title: Text('Step circle Progressbar'),
        ),
        body: Center(
          child: StepCircleProgressbar(
              size: 200,
              circleSize: 15,
              currentSteps: 15,
              totalSteps: 25,
              progressColor: Color.fromARGB(255, 2, 145, 45),
              stepColor: Color.fromARGB(255, 137, 255, 147)),
        ),
      ),
    );
  }
}

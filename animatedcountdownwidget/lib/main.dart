import 'package:animated_countdown/animated_countdown.dart';
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
          title: Text('Animated count down Widget'),
        ),
        body: Center(
          child: Text('hello'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          CountDownWidget(
            stepDuration: 3,
            textStyle: const TextStyle(color: Colors.red),
            maxTextSize: 100,
            minTextSize: 10,
            onEnd: () {
              // do some job
            },
          );
        }),
      ),
    );
  }
}

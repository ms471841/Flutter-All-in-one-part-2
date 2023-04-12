import 'package:dotted_line/dotted_line.dart';
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
          title: Text('Dote Lines'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 5.0,
                dashLength: 1.0,
                dashColor: Color.fromARGB(255, 255, 255, 255),
                // dashGradient: [Colors.red, Colors.blue],
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Color.fromARGB(0, 0, 0, 0),
                dashGapGradient: [Colors.red, Colors.blue],
                dashGapRadius: 0.0,
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 100,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.black,
                dashGradient: [Colors.red, Colors.blue],
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapGradient: [Colors.red, Colors.blue],
                dashGapRadius: 0.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

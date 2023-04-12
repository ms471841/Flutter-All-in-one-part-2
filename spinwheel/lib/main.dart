import 'package:flutter/material.dart';
import 'package:wheel_spin/wheelspin.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  WheelSpinController wheelSpinController = WheelSpinController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spin Wheel Flutter'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: [
              WheelSpin(
                controller: wheelSpinController,
                pathImage: 'assets/s1.png',
                withWheel: 300,
                pieces: 6,
                speed: 300, //defuaft is 500
                isShowTextTest: true,
                // offset: 1 / (10 * 6), //random 1/10 pieces defuaft is zero
              ),
              Icon(
                Icons.arrow_circle_up,
                size: 50,
              ),
              TextButton(
                  onPressed: () {
                    wheelSpinController.startWheel();
                  },
                  child: Text("Start Spin the Wheel")),
              TextButton(
                  onPressed: () {
                    wheelSpinController.stopWheel(2);
                  },
                  child: Text("Stop Spin the Wheel"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';

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
          title: Text('Slide Action Widget'),
        ),
        body: SlideAction(
          trackBuilder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Thumb fraction: ${state.thumbFractionalPosition.toStringAsPrecision(2)}",
                ),
              ),
            );
          },
          thumbBuilder: (context, state) {
            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            );
          },
          action: () {
            debugPrint("Hello World");
          },
        ),
      ),
    );
  }
}

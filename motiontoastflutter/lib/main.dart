import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: RunMyApp(),
  ));
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motion Toast'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              MotionToast.success(
                title: Text("Congratulations from GeeksforGeeks"),
                description: Text("You have Completed your first round, Kindly wait for the result"),
              ).show(context);
            },
            child: Text('Show toast')),
      ),
    );
  }
}

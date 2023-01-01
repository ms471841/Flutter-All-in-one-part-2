import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  bool val = false;
  bool isverified = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GeeksforGeeks'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GeeksforGeeks',
                    style: TextStyle(fontSize: 50),
                  ),
                  Visibility(
                      visible: isverified,
                      child: Icon(
                        Icons.verified_rounded,
                        color: Colors.green,
                      ))
                ],
              ),
              Checkbox(
                  value: val,
                  onChanged: ((value) {
                    setState(() {
                      val= value!;
                      isverified = value;
                    });
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

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
          title: Text('Disable Button'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Enabled Button'),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                onPressed: null,
                child: Text('Disabled Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loadingkit_flutter/loadingkit_flutter.dart';

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
          title: Text('Flutter Loading'),
        ),
        body: Center(
          child: FlutterLoading(
              isLoading: true,
              child: Text('Welcome Geeks'),
              color: Colors.green),
        ),
      ),
    );
  }
}

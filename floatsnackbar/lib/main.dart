import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home:RunMyApp()));
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Floating Snackbar'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              FloatingSnackBar(
                message: 'Hi GeeksforGeeks, we are back',
                context: context,
                textColor: Colors.black,
                textStyle: const TextStyle(color: Colors.green),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: Color.fromARGB(255, 220, 234, 236),
              );
            },
            child: const Text('Show Floating SnackBar'),
          ),
        ),
     
    );
  }
}

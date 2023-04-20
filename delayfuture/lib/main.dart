import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delayed Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: DelayedWidget(),
    );
  }
}

class DelayedWidget extends StatefulWidget {
  const DelayedWidget({super.key});

  @override
  _DelayedWidgetState createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget> {
  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delayed Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showText)
              Text(
                'Delayed Text GeeksforGeeks',
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showText = false;
                });

                Future.delayed(Duration(seconds: 3), () {
                  setState(() {
                    _showText = true;
                  });
                });
              },
              child: Text('Show Text After Delay 3 seconds'),
            ),
          ],
        ),
      ),
    );
  }
}

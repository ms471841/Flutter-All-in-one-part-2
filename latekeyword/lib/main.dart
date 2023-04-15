import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        title: 'Flutter Late Keyword Example',
        home: MyWidget());
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  late String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Late Keyword Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showUsername(context),
          child: Text('Show Title'),
        ),
      ),
    );
  }

  void _showUsername(BuildContext context) async {
    // simulate fetching data from an API
    await Future.delayed(Duration(seconds: 2));

    // set the value of _username
    _title = 'GeekdForGeeks';

    // show the username in a dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Title'),
        content: Text(_title),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

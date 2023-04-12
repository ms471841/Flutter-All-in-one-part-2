import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  @override
  _RunMyAppState createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  String _fileContents = '';

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  Future<void> loadAsset() async {
    String fileText = await rootBundle.loadString('assets/about.txt');
    setState(() {
      _fileContents = fileText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Asset Text File Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Text(_fileContents),
        ),
      ),
    );
  }
}

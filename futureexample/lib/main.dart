import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(RunMyApp());

class RunMyApp extends StatefulWidget {
  @override
  _RunMyAppState createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  String _data = 'Loading...';

  Future<void> _fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      setState(() {
        _data = 'Title: ${body['title']}, Completed: ${body['completed']}';
      });
    } else {
      setState(() {
        _data = 'Failed to fetch data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'Flutter Future Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Future Example'),
        ),
        body: Center(
          child: Text(_data),
        ),
      ),
    );
  }
}

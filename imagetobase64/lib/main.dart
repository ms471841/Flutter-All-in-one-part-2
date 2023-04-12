import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  String base64String = '';

  ImagetoBase64() async {
    //path of image
    String _imagePath = "assets/gfglogo.png";
    File _imageFile = File(_imagePath);

// Read bytes from the file object
    Uint8List _bytes = await _imageFile.readAsBytes();

// base64 encode the bytes
    String _base64String = base64.encode(_bytes);
    setState(() {
      base64String = _base64String;
      print(base64String);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image to Base64 String'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/gfglogo.png'),
              ),
              ElevatedButton(
                onPressed: () {
                  ImagetoBase64();
                },
                child: Text('Convert'),
              ),
              Text(
                base64String,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              )
            ],
          ),
        ),
      ),
    );
  }
}

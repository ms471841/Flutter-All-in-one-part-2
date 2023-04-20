import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: RunMyApp()));
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Image Clicked!')));
          },
          child: SvgPicture.asset(
            'assets/images/s1.svg',
            semanticsLabel: 'My SVG Image',
            height: 100,
            width: 70,
          ),
        ),
      ),
    );
  }
}

import 'package:five_pointed_star/five_pointed_star.dart';
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
  int mycount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Five point star'),
        ),
        body: Center(
            child: Column(
          children: [
            
            FivePointedStar(
              onChange: (count) {
                setState(() {
                  mycount = count;
                });
              },
            ),
            Text(mycount.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        )),
      ),
    );
  }
}

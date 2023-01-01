import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home :RunMyApp(),
    theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
  ));
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    
      return Scaffold(
        appBar: AppBar(title: Text('Clickable card'),),
        body: Center(
          child: GestureDetector(
            
            onTap: () {
               ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gesture Detected!')));
             
            },
            child: Container(
            
              height: 100,
              child: Card(
                elevation: 10,
                child: Text('Geeks for Geeks, Hello this is clickable card, tap me'),
                color: Colors.cyanAccent,
                
              ),
            ),
          ),
        ),
      
    );
  }
}

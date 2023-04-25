import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        // this to prevent the default sliding behaviour
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("Open Drawer Programmatically"),
        ),
        body: Center(
          child: Builder(
            builder: (context) => // Ensure Scaffold is in context
                MaterialButton(
                    child: Text('Open Drawer '),
                    onPressed: () => Scaffold.of(context).openDrawer()),
          ),
        ),
      ),
    );
  }
}

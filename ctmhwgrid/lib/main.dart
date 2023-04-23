import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: RunMyApp(),
  ));
}

class RunMyApp extends StatefulWidget {
  @override
  _RunMyAppState createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  List<String> widgetList = ['Geeks', 'for', 'Geeks'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Height and Width"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: widgetList.map((String value) {
            return Container(
              color: Colors.amberAccent,
              margin: EdgeInsets.all(1.0),
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scrolling_text/scrolling_text.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              width: 30,
              color: const Color.fromARGB(255, 128, 184, 230),
              padding: const EdgeInsets.all(10),
              child: ScrollingText(
                text: news[index],
                scrollAxis: Axis.vertical,
                onFinish: () {
                  if (index <= news.length) {
                    index++;
                  } else {
                    index = 0;
                  }
                  setState(() {});
                },
              ),
            ),
          ),
        ));
  }
}

int index = 0;
  List<String> news = [
    'Hello Geeks',
    'You can learn more by visitng GeeksforGeeks',
    'you can also prepare for the MNC companies in Practice section',
    'drfgeger',
    
  ];

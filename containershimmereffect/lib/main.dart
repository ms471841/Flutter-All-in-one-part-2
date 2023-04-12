import 'package:flutter/material.dart';
import 'package:shimmer_container/shimmer_container.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  Widget Shimmer() {
    return ShimmerContainer(
      height: 80,
      width: double.maxFinite,
      radius: 4,
      highlightColor: Color(0xffF9F9FB),
      baseColor: Color(0xffE6E8EB),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Shimmer Container'),
          ),
          body: Column(
            children: [
              Shimmer(),
              SizedBox(
                height: 2,
              ),
              Shimmer(),
              SizedBox(
                height: 2,
              ),
              Shimmer(),
              SizedBox(
                height: 2,
              ),
              Shimmer(),
              SizedBox(
                height: 2,
              ),
              Shimmer(),
            ],
          )),
    );
  }
}

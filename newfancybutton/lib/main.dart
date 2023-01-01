import 'package:flutter/material.dart';
import 'package:fancy_button_new/fancy_button_new.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fancy Buttons'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              MyFancyButton(
                isIconButton: false,
                fontSize: 30,
                text: 'Fancy Button',
                buttonColor: Colors.green,
                hasShadow: false,
                tap: () {},
              ),
              SizedBox(
                height: 5,
              ),
              MyFancyButton(
                  isIconButton: false,
                  fontSize: 15,
                  text: "Colored Button",
                  tap: () {},
                  fontColor: Colors.white,
                  buttonColor: Colors.purple,
                  hasShadow: false),
              SizedBox(
                height: 5,
              ),
              MyFancyButton(
                  isIconButton: false,
                  fontSize: 15,
                  borderRadius: 10,
                  text: "Rounded Button",
                  tap: () {},
                  fontColor: Colors.white,
                  buttonColor: Colors.red,
                  hasShadow: false),
              SizedBox(
                height: 5,
              ),
              MyFancyButton(
                  isIconButton: false,
                  fontSize: 15,
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  shadowColor: Colors.black.withOpacity(0.25),
                  text: "Shadow Button",
                  tap: () {},
                  fontColor: Colors.white,
                  buttonColor: Colors.cyan,
                  hasShadow: true),
              SizedBox(
                height: 5,
              ),
              MyFancyButton(
                  isIconButton: false,
                  // image: "assets/icons/select.png",
                 // imageHeight: 20,
                  //imageWidth: 20,
                  fontSize: 15,
                  text: "Image Button",
                  tap: () {},
                  fontColor: Colors.white,
                  buttonColor: Colors.yellow,
                  hasShadow: false),
              SizedBox(
                height: 5,
              ),
              MyFancyButton(
                  isIconButton: false,
                  borderColor: Colors.white,
                  borderRadius: 10,
                  fontSize: 15,
                  text: "Outlined Button",
                  tap: () {},
                  fontColor: Colors.white,
                  buttonColor: Colors.black,
                  hasShadow: true),
            ],
          ),
        ),
      ),
    );
  }
}

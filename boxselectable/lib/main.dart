import 'package:flutter/material.dart';
import 'package:selectable_box/selectable_box.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(appBar: AppBar(title: Text('Selectable Box'),),
       body:Center(
         child: SelectableBox(
          height: 250,
          width: 400,
          color: Colors.white,
          isSelectedColor: Colors.white,
          borderColor: Colors.grey,
          isSelectedBorderColor: Color.fromARGB(255, 18, 114, 21),
          borderWidth: 1,
          borderRadius: 10,
          padding: const EdgeInsets.all(8),
          animationDuration: const Duration(milliseconds: 200),
          opacity: 0.5,
          isSelectedOpacity: 1,
          checkboxAlignment: Alignment.topRight,
          checkboxPadding: const EdgeInsets.all(8),
          selectedIcon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          unselectdIcon: const Icon(
            Icons.check_circle_outline,
            color: Colors.grey,
          ),
          showCheckbox: true,
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          isSelected: isSelected,
          child: const Image(
            image: AssetImage('assets/gfglogo.png'),
            fit: BoxFit.cover,
          ),
      ),
       ), 
      )
    );
  }
}

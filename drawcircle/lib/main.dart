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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container(
          width: 200,
          child: Row(
            children: [
              CustomPaint(
                foregroundPainter: CircleProgress(done: 3, total: 4),
                size: Size(20, 20),
                // child: Center(child: Text("3/4")),
              ),
              Text("Weeks"),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleProgress extends CustomPainter {
  int done;
  int total;

  CircleProgress({required this.total, required this.done});

  final strokeWidth = 8.0;
  @override
  void paint(Canvas canvas, Size size) {
    Paint totalCircle = Paint()
      ..strokeWidth = strokeWidth
      ..color = const Color(0xFF8989BE)
      ..style = PaintingStyle.stroke;

    Paint doneCircle = Paint()
      ..strokeWidth = strokeWidth
      ..color = const Color(0xFFDFDFFD).withOpacity(0.96)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(29, 29);
    double radius = 25;
    double angle = 2 * 3.14 * (done / total);

    canvas.drawCircle(center, radius, totalCircle);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 3.14 / 2,
        angle, false, doneCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

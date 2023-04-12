import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(ImageDimensionsScreen());
}

class ImageDimensionsScreen extends StatefulWidget {
  @override
  _ImageDimensionsScreenState createState() => _ImageDimensionsScreenState();
}

class _ImageDimensionsScreenState extends State<ImageDimensionsScreen> {
  late Image _image;
  late ui.Image _uiImage;

  @override
  void initState() {
    super.initState();
    _image = Image.asset('assets/oops.png');
    _loadImage();
  }

  Future<void> _loadImage() async {
    Completer<ui.Image> completer = Completer();

    _image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          completer.complete(info.image);
        },
      ),
    );

    _uiImage = await completer.future;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Dimensions'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_uiImage != null)
                Image.asset(
                  'assets/oops.png',
                  width: _uiImage.width.toDouble(),
                  height: _uiImage.height.toDouble(),
                ),
              SizedBox(height: 20),
              if (_uiImage != null)
                Text(
                  'Image dimensions: ${_uiImage.width} x ${_uiImage.height}',
                  style: TextStyle(fontSize: 20),
                ),
              if (_uiImage == null) CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

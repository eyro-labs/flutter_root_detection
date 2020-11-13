import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_root_detection/flutter_root_detection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool rooted, developerMode;

  bool get checking => rooted == null && developerMode == null;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool rooted = true, developerMode = true;

    try {
      rooted = await flutterRootDetection.rooted;
      developerMode = await flutterRootDetection.developerMode;

      if (mounted) {
        setState(() {
          this.rooted = rooted;
          this.developerMode = developerMode;
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Root Detection'),
        ),
        body: Center(
          child: checking
              ? CircularProgressIndicator()
              : Text('Rooted = ${rooted ? 'YES' : 'NO'}\n'
                  'Dev Mode = ${developerMode ? 'YES' : 'NO'}'),
        ),
      ),
    );
  }
}


import 'package:dummy/Views/imageview.dart';
import 'package:dummy/Views/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      home: ImageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}


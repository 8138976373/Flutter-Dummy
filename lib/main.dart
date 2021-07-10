// import 'package:dummy/Views/login.dart';
import 'package:flutter/material.dart';

import 'ImageGetXApp/views/imageview.dart';
import 'commonservices/getit.dart';

void main() {
  serviceLocators();
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

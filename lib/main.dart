import 'package:flutter/material.dart';
import 'package:samachar/Views/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'samachar',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   the
      //   primaryColor: Colors.white,
      //),
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

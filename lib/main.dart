import 'package:exam_flutter/screen/Form.dart';
import 'package:exam_flutter/screen/adddatapage.dart';
import 'package:exam_flutter/screen/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'formpage': (context) => FormPage(),
        'detailPage': (context) => DetailPage(),
      },
      home: const HomePage(),
    );
  }
}

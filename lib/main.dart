import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product routing demo home page'),
    );
  }
}







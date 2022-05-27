import 'package:flutter/material.dart';

import 'productbox.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? thekey, required this.title}) : super(key: thekey);
  
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: [
          ProductBox(name: "iPhone", description: "iPhone is the stylish phone", price: 1000, image: "iphone.jpg"),
          ProductBox(name: "Pixel", description: "Pixel is the featurefull phone", price: 800, image: "pixel.jpg"),
          ProductBox(name: "Laptop", description: "Laptop is a productive tool", price: 2000, image: "laptop.jpg"),
          ProductBox(name: "Tablet", description: "Tablet is a media tool", price: 1500, image: "tablet.jpg"),
          ProductBox(name: "Pendrive", description: "Pendrive is a storage medium", price: 100, image: "pendrive.jpg"),
          ProductBox(name: "Floppy Drive", description: "Floppy Drive is an ancient technology", price: 20, image: "floppydisk.jpg"),
        ],
      )
    );
  }
}
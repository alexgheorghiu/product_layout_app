import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

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

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.name, required this.description, required this.price, required this.image}): super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child : Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/' + image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.description),
                    Text("Price: " + this.price.toString())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


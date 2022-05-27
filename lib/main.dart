import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(const MyApp());

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;

  Product(this.name, this.description, this.price, this.image, this.rating);

  factory Product.fromMap(Map<String, dynamic> json){
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
      json['rating'],
    );
  }

  void updateRating(int myRating){
    rating = myRating;

    notifyListeners();
  }

  static List<Product> getProducts(){
    List<Product> items = <Product>[];

    items.add(Product(
      "iPhone", 
      "iPhone is the stylish phone", 
      1000, 
      "iphone.jpg", 
      0));

    items.add(Product(
      "Pixel", 
      "Pixel is the featurefull phone", 
      800, 
      "pixel.jpg", 
      0));

    items.add(Product(
      "Laptop", 
      "Laptop is a productive tool", 
      2000, 
      "laptop.jpg", 
      0));

    items.add(Product(
      "Tablet", 
      "Tablet is a media tool", 
      1500, 
      "tablet.jpg", 
      0));

    items.add(Product(
      "Pendrive", 
      "Pendrive is a storage medium", 
      100, 
      "pendrive.jpg", 
      0));

    items.add(Product(
      "Floppy Drive", 
      "Floppy Drive is an ancient technology", 
      20, 
      "floppydisk.jpg", 
      0));

    return items;
  }
}

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
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? thekey, required this.title}) : super(key: thekey);
  
  final String title;
  final items = Product.getProducts();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return ProductBox(item: items[index]);
        },
      )
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}): super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child : Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/' + item.image),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ScopedModel<Product>(
                  model: this.item,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(this.item.description),
                      Text("Price: " + this.item.price.toString()),
                      ScopedModelDescendant<Product>(
                        builder: (context, child, item) {
                          return RatingBox(item: item);
                        }
                        )
                    ],
                  ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RatingBox extends StatelessWidget{
  final Product item;

  RatingBox({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context){
    double _size = 20; // star size
    print(item.rating);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 1 ? Icon(Icons.stars, size: _size,) :  Icon(Icons.star_border, size: _size, )),
            color: Colors.red[500],
            onPressed: () => this.item.updateRating(1),
            iconSize: _size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 2 ? Icon(Icons.stars, size: _size,) :  Icon(Icons.star_border, size: _size, )),
            color: Colors.red[500],
            onPressed: () => this.item.updateRating(2),
            iconSize: _size,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >= 3 ? Icon(Icons.stars, size: _size,) :  Icon(Icons.star_border, size: _size, )),
            color: Colors.red[500],
            onPressed: () => this.item.updateRating(3),
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}


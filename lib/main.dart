import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'myhomepage.dart';
import 'product.dart';

void main() => runApp(MyApp(products: fetchProducts()));


class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.products }) : super(key: key);

  Future<List<Product>> products;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product routing demo home page', products: products,),
    );
  }
}


  List<Product> parseProducts(String resposeBody){
    final parsed = json.decode(resposeBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> fetchProducts() async {
    var url = Uri.http('192.168.100.26:8000','products.json');
    print('Uri : ${url}');

    final response = await http.get(url);
    if(response.statusCode == 200){
      return parseProducts(response.body);
    }
    else{
      throw Exception("Unable to fetch products from REST API. Status code = ${response.statusCode}");
    }
  }







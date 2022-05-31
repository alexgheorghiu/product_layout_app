import 'package:flutter/material.dart';
import 'package:product_layout_app/productboxlist.dart';

import 'product.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? thekey, required this.title, required this.products}) : super(key: thekey);
  
  final String title;
  final Future<List<Product>> products;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: Center(
        child: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot){
            if(snapshot.hasError) print(snapshot.error);

            return snapshot.hasData ? ProductBoxList(items: snapshot.data) : const Center(child: Text('No data'));
          },
        ),
      )
    );
  }
}
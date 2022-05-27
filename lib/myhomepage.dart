import 'package:flutter/material.dart';

import 'productbox.dart';
import 'product.dart';
import 'productpage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? thekey, required this.title}) : super(key: thekey);
  
  final String title;
  final  items = Product.getProducts();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ProductPage(item:items[index],)
                  )
                );
            },
          );
        },
      )
    );
  }
}
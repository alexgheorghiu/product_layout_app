import 'package:flutter/material.dart';

import 'product.dart';
import 'productbox.dart';
import 'productpage.dart';

class ProductBoxList extends StatelessWidget {
  final List<Product>? items;

  ProductBoxList({Key? key, this.items});

  @override
  Widget build(BuildContext context){
    
    return ListView.builder(
        itemCount: items!.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: ProductBox(item: items![index]),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ProductPage(item:items![index],)
                  )
                );
            },
          );
        },
      );
    
  }
}
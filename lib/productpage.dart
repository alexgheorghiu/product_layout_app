import 'package:flutter/material.dart';
import 'package:product_layout_app/ratingbox.dart';

import 'product.dart';

class ProductPage extends StatelessWidget {
    ProductPage({Key? key, required this.item}) : super(key:key);

    final Product item;

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text(item.name),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  // width: 100%,
                  height: 300,
                  child: FittedBox(
                    child: Image.asset("assets/" + item.image),
                    fit: BoxFit.fill,
                    
                ),
                ),
                                
                // SizedBox(
                //   child: Image.asset("assets/" + item.image),                  
                // ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(item.name, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(item.description),
                        Text("Price: " + item.price.toString()),
                        RatingBox(),
                      ],
                    ),
                  )
                  )
              ],
            ),
          ),
        ),
      );
    }
}
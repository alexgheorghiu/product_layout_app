
import 'package:flutter/material.dart';

import 'RatingBox.dart';

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
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
                    RatingBox(),
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
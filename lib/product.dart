class Product{
  final String name;
  final String description;
  final int price;
  final String image;
  // int rating;

  Product(this.name, this.description, this.price, this.image/*, this.rating*/);

  factory Product.fromMap(Map<String, dynamic> json){
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
      // json['rating'],
    );
  }

  // void updateRating(int myRating){
  //   rating = myRating;

  //   notifyListeners();
  // }

  static List<Product> getProducts(){
    List<Product> items = <Product>[];

    items.add(Product(
      "iPhone", 
      "iPhone is the stylish phone", 
      1000, 
      "iphone.jpg", 
      // 0
      ));

    items.add(Product(
      "Pixel", 
      "Pixel is the featurefull phone", 
      800, 
      "pixel.jpg", 
      // 0
      ));

    items.add(Product(
      "Laptop", 
      "Laptop is a productive tool", 
      2000, 
      "laptop.jpg", 
      // 0
      ));

    items.add(Product(
      "Tablet", 
      "Tablet is a media tool", 
      1500, 
      "tablet.jpg", 
      // 0
      ));

    items.add(Product(
      "Pendrive", 
      "Pendrive is a storage medium", 
      100, 
      "pendrive.jpg", 
      // 0
      ));

    items.add(Product(
      "Floppy Drive", 
      "Floppy Drive is an ancient technology", 
      20, 
      "floppydisk.jpg", 
      // 0
      ));

    return items;
  }
}
import 'dart:convert';

import 'package:ecommerce/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<List<dynamic>> getData(BuildContext context) async {
  var model = Provider.of<AppState>(context);
  List<dynamic> products = [];
  var json =
      await DefaultAssetBundle.of(context).loadString('assets/clothing.json');
  var data = Map<String, dynamic>.from(jsonDecode(json.toString()));
  Map<String, dynamic> clothing = data['clothing'];
  clothing.forEach((key, value) {
    products
        .addAll(value.map((p) => Product.fromJSON(p, categorie: key)).toList());
  });
  model.setProducts = products;
  model.setCategories = clothing.keys.toList();
  return products;
}

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String categorie;
  Product(
      {@required this.id,
      @required this.categorie,
      @required this.title,
      this.description,
      @required this.price,
      @required this.image});
  factory Product.fromJSON(Map<String, dynamic> data, {String categorie='Shoes'}) {
    return Product(
      categorie: categorie,
      title: data['title']??'',
      description: data['description']??'',
      price: data['price']??'',
      image: data['image']??'',
      id: data['id']??'',
    );
  }
}

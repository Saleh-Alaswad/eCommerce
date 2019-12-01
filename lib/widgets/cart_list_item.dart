
import 'package:ecommerce/pages/product_details.dart';
import 'package:ecommerce/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../slide.dart';

class CartListitem extends StatelessWidget {
  final Product product;
  CartListitem(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, SlideUpRoute(page: Details(product))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(product.image),
              radius: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.description,
                    style: TextStyle(color: Colors.grey),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('\$${product.price}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

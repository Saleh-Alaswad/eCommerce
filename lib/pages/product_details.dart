import 'package:ecommerce/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../products.dart';

class Details extends StatelessWidget {
  final Product product;

  const Details(this.product);
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppState>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Column(
          children: <Widget>[
            Text(product.title),
            Text(
              '${product.price}',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        trailing: Icon(CupertinoIcons.shopping_cart),
      ),
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  product.image,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  child: Text(
                    'SELECT COLOR',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  child: Text(
                    'SELECT SIZE',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      child: Center(child: Text('5.5')),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Center(child: Text('6.0')),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Center(child: Text('6.5')),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Center(child: Text('7.0')),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  child: Text(
                    '${product.description}',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                child: MaterialButton(
                  child: Text('ADD TO CART',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: CupertinoTheme.of(context).primaryColor)),
                  onPressed: () => model.addProductToCart(product.id),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/app_state.dart';
import 'package:ecommerce/products.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../slide.dart';
import 'product_details.dart';


class Category extends StatelessWidget {
  final String categorie;
  final String collectionId;

  const Category({@required this.categorie, @required this.collectionId});
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppState>(context);
    return FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          var products =
              snapshot?.data?.where((p) => p.categorie == categorie)?.toList();
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(categorie),
            ),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  ListView.separated(
                    itemBuilder: (context, index) {
                      return CategorieListItem(products[index]);
                    },
                    itemCount: products?.length ?? 0,
                    separatorBuilder: (context, index) => Divider(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('TOTAL'),
                              Text('\$${model.totalCost}'),
                              Text('Free Shipping'),
                            ],
                          ),
                          CustomButton(
                            label: 'CHECKOUT',
                            onPressed: null,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CategorieListItem extends StatelessWidget {
  final Product product;

  const CategorieListItem(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        SlideUpRoute(
          page: Details(product),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(product.image),
              radius: 35,
            ),
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: 200,
                      child: Text(
                        product.description,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[700]),
                      )),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('\$${product.price}')))
          ],
        ),
      ),
    );
  }
}

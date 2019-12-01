import 'package:ecommerce/app_state.dart';
import 'package:ecommerce/widgets/cart_list_item.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../slide.dart';
import 'checkout.dart';

class ShippingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppState>(context);
    return SafeArea(
      bottom: false,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  'Cart',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CartListitem(model.getProductById(model.getCartItems.keys.elementAt(index)));
                  },
                  itemCount: model.getCartItems.length,
                  separatorBuilder: (context, index) => Divider(),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
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
                    onPressed: ()=> Navigator.push(context, SlideUpRoute(page: Checkout())),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

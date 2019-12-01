
import 'package:ecommerce/app_state.dart';
import 'package:ecommerce/widgets/address.dart';
import 'package:ecommerce/widgets/cart_list_item.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/payment.dart';
import 'package:ecommerce/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppState>(context);
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageTitle('Checkout', close: true),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildItem(model),
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }

  Widget _buildItem(AppState model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ShippingAddress(
          city: 'DevCity',
          name: 'Saleh Alaswad',
          country: 'Germany',
          postalCode: '0123',
          street: 'DevStreet 13',
        ),
        PaymentMethod(card: 'MasterCard', lastDigits: 30),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                child: Text(
                  'ITEMS',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
             
            ],
          ),
        ),
        Flexible(
          
          child: ListView.builder(
            itemCount: model.getCartItems.keys.length,
            itemBuilder: (context, index) {
              return CartListitem(
                  model.getProductById(model.getCartItems.keys.elementAt(index)));
            },
          ),
        )
      ],
    );
  }
}

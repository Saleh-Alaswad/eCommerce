
import 'package:ecommerce/widgets/address.dart';
import 'package:ecommerce/widgets/payment.dart';
import 'package:ecommerce/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PageTitle('Profile'),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/user.jpg'),
                    ),
                    SizedBox(height: 30),
                    Text('Saleh Alaswad', style: TextStyle(fontSize: 24)),
                    Text('saleh.alaswad03@gmail.com',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 30),
                    ShippingAddress(
                      country: 'Germany',
                      name: 'Saleh Alaswad',
                      postalCode: '0123',
                      street: 'Dev Str. 13',
                      city: 'DevCity',
                    ),
                    PaymentMethod(card: 'MasterCard', lastDigits: 30),
                    SizedBox(height: 30),
                    CupertinoButton.filled(
                      onPressed: () {},
                      child: Text('SIGN OUT'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

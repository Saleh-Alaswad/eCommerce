import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  final String name;
  final String street;
  final String city;
  final String postalCode;
  final String country;

  const ShippingAddress(
      {@required this.name,
      @required this.city,
      @required this.street,
      @required this.postalCode,
      @required this.country});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 5),
            child: Text(
              'SHIPPING ADDRESS',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.place),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      street,
                      maxLines: 2,
                      style: TextStyle(letterSpacing: 1.5),
                    ),
                    Text(
                      postalCode + ' ' + city,
                      maxLines: 2,
                      style: TextStyle(letterSpacing: 1.5),
                    ),
                    Text(
                      country,
                      maxLines: 2,
                      style: TextStyle(letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

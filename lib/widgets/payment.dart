import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final String card;
  final int lastDigits;
  PaymentMethod({@required this.card, @required this.lastDigits});
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
              'PAYMENT METHOD',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.credit_card),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '$card ending **$lastDigits',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
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

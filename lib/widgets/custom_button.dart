import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  const CustomButton({@required this.onPressed, @required this.label});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoTheme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding:
            const EdgeInsets.only(left: 20.0, top: 10, bottom: 10, right: 10),
        child: Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

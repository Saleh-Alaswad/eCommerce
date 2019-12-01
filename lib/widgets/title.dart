import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final bool close;
  const PageTitle(this.title, {this.close = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: close
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                GestureDetector(
                  child: Icon(Icons.close,size: 30,),
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            )
          : Text(
              title,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
    );
  }
}

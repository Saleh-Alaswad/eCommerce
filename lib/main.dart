import 'package:ecommerce/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() => runApp(
      ChangeNotifierProvider<AppState>(
        builder: (context) => AppState(),
        child: Ecommerce(),
      ),
    );

class Ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: Colors.orange[800],
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: Colors.grey[900]),
          actionTextStyle: TextStyle(color: Colors.yellow[900]),
        ),
      ),
      home:Home(),
    );
  }

  
}

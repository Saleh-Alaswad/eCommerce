
import 'package:ecommerce/pages/categories.dart';
import 'package:ecommerce/pages/category.dart';
import 'package:ecommerce/slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  final List<dynamic> categories;

  const CategoriesRow(this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  SlideUpRoute(
                    page: Category(
                      categorie: categories[0] ?? '',
                      collectionId: categories[0] ?? '',
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.red,
                        ),
                        Image.asset(
                          'assets/shoes.png',
                          width: 70,
                          height: 70,
                        ),
                      ],
                    ),
                    Text(categories[0] ?? '')
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  SlideUpRoute(
                    page: Category(
                      categorie: categories[1] ?? '',
                      collectionId: categories[1] ?? '',
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.yellow,
                        ),
                        Image.asset(
                          'assets/tshirt.png',
                          width: 70,
                          height: 70,
                        ),
                      ],
                    ),
                    Text(categories[1] ?? '')
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  SlideUpRoute(
                    page: Category(
                      categorie: categories[2] ?? '',
                      collectionId: categories[2] ?? '',
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.green,
                        ),
                        Image.asset(
                          'assets/jacket.png',
                          width: 70,
                          height: 70,
                        ),
                      ],
                    ),
                    Text(categories[2] ?? '')
                  ],
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(context, SlideUpRoute(page: Categories())),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                    Text('See All')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

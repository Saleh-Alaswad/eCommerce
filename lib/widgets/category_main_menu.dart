
import 'package:ecommerce/pages/categories.dart';
import 'package:ecommerce/pages/category.dart';
import 'package:ecommerce/slide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  final List<dynamic> categories;
  final CupertinoTabController controller;
  const CategoriesRow(this.categories, {this.controller});

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
              _buildCategoryItem(
                background: Colors.red,
                category: categories[0],
                context: context,
                image: 'assets/shoes.png',
              ),
              _buildCategoryItem(
                background: Colors.yellow,
                category: categories[1],
                context: context,
                image: 'assets/jacket.png',
              ),
              _buildCategoryItem(
                background: Colors.green,
                category: categories[2],
                context: context,
                image: 'assets/tshirt.png',
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

  Widget _buildCategoryItem(
      {@required BuildContext context,
      @required String category,
      @required String image,
      @required Color background}) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        SlideUpRoute(
          page: Category(categorie: category??'', collectionId: category??'',),
        ),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: background),
                width: 75,
                height: 75,
              ),
              Image.asset(
                image,
                width: 75,
                height: 75,
              ),
            ],
          ),
          Text(category ?? '')
        ],
      ),
    );
  }
}


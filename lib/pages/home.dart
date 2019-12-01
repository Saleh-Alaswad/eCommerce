
import 'package:ecommerce/widgets/category_main_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import 'profile.dart';
import 'cart.dart';
import 'search.dart';

class Home extends StatelessWidget {
  final int pageIndex;
  const Home({this.pageIndex = 0});
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: pageIndex,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart), title: Text('Cart')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), title: Text('Profile')),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CategoriesRow(
                      [  'Shoes',
                        'Shirts',
                        'Jackets',],
                    ),
                  ),
                _buildOffer(context),
                 _buildCartItems(context),
                ],
              ),
            );
          case 1:
            return Search();
          case 2:
            return ShippingCart();
          default:
            return Profile();
        }
      },
    );
  }

  Widget _buildOffer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Sale',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.amber[900], BlendMode.screen),
                    image: AssetImage(
                      'assets/shoes3.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2.5,
              ),
              Positioned(
                top: 15,
                left: 25,
                right: 175,
                bottom: 25,
                child: Text(
                  'For all your\twinter clothing\tup to 30% sale',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      height: 1.5,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                left: 25,
                bottom: 15,
                child: GestureDetector(
                  onTap: null,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text(
                          'MORE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItems(BuildContext context) {
    var model = Provider.of<AppState>(context);
    var products = model.getCartItems.entries
        .map((e) => model.getProductById(e.key))
        .toList();
    int length = products.length > 2 ? 3 : products.length;
 
    return length > 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'In Cart',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Container(
                  height: 175,
                  child: ListView.builder(
                    itemCount: length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 3)
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.red,
                                child: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white),
                              ),
                              Text('See All')
                            ],
                          ),
                        );
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              products[index].image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(products[index].title),
                            Text('\$${products[index].price}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}

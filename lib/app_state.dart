
import 'package:ecommerce/products.dart';
import 'package:flutter/foundation.dart' as foundation;

class AppState extends foundation.ChangeNotifier {
  String _selectedCategory = '';
  final _productsInCart = <String, int>{};
  List<Product> _allProducts = [];
  double _totalCost = 0;
  List<String> _categories;
  //getters
  Map<String, int> get getCartItems => _productsInCart;
  double get totalCost => _totalCost;
  List<String> get categories => _categories;
  //setters
  set setProducts(List products) {
    _allProducts = products;
    notifyListeners();
  }

  set setCategories(List<String> categories) {
    _categories = categories;
    notifyListeners();
  }

  //methods
  void addProductToCart(String productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId]++;
    }
    _totalCost += getProductById(productId).price;
    notifyListeners();
  }

  List<Product> search(String searchTerms) {
    return _allProducts
        .where((product) =>
            product.title.toLowerCase().contains(searchTerms.toLowerCase()))
        .toList();
  }

  Product getProductById(String id) {
    return _allProducts.firstWhere((p) => p.id == id);
  }

  void removeItemFromCart(String productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId]--;
      }
    }
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}

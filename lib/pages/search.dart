import 'package:ecommerce/app_state.dart';
import 'package:ecommerce/widgets/cart_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String searchTerms;
  @override
  void initState() {
    searchTerms = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<AppState>(context);
    _controller
        .addListener(() => setState(() => searchTerms = _controller.text));
    var products = model.search(searchTerms);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoTextField(
          
          focusNode: _focusNode,
          controller: _controller,
          prefix: Icon(CupertinoIcons.search,),
          suffix: Icon(CupertinoIcons.clear,size: 30,),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return CartListitem(products[index]);
        },
        itemCount: products.length,
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

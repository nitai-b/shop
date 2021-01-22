import 'package:flutter/material.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  //this is how you pass data form one place to the next using the material page route which is something that is created on the fly
  // final String title;
  //
  // ProductDetailScreen(this.title);

  //another way to pass data is to used a named constructor and pass data using the named route
  static const routeName = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments
        as String; // this would give the id using the named route

    final loadedProduct =
        Provider.of<ProductsProvider>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //it is important to note that this provider.of(context) would
    //return the provider that is supplied in the parent widget
    //of the widget tree. and only the child widgets of this widget
    //would trigger a rebuild when anything changes or notify listeners
    //is called

    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items; // this is fucking amazing lol

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (context, i) => ProductItem(products[i].id,
            products[i].title, products[i].imageUrl),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      );
  }
}
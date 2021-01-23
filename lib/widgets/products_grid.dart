import 'package:flutter/material.dart';
import 'file:///C:/Users/nitai/nitai-projects/shop/lib/providers/product.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    //it is important to note that this provider.of(context) would
    //return the provider that is supplied in the parent widget
    //of the widget tree. and only the child widgets of this widget
    //would trigger a rebuild when anything changes or notify listeners
    //is called

    final productsData = Provider.of<ProductsProvider>(context);
    final products = showFavs
        ? productsData.favouriteItem
        : productsData.items; // this is fucking amazing lol

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: products[i], // products[i] is One Product
        // so this would return an instance of product as it is in the ProductsProvider
        child: ProductItem(
            // products[i].id, products[i].title, products[i].imageUrl
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}

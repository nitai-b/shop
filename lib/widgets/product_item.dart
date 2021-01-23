import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          //this is how you pass data using the constructor
          // onTap: () {
          //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          //     return ProductDetailScreen(title);
          //   }));
          // },
          //this is how you pass data using the named constructor and a named route in the main dart file
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, child) {
              return IconButton(
                icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavouriteStatus();
                },
                color: Theme.of(context).accentColor,
              );
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

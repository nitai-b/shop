import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            // this is the first place I am using the child parameter of the builder method
            // the child is whatever you don't want to rebuild in the consumer widget.
            // so in this case, the badge has a child of icon button.
            // so the consumer takes that icon button and passes that into the builder which builds the badge with the
            // child icon button as the child of the badge
            builder: (_, cartData, _child) => Badge(child: _child, value: cartData.itemCount.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}

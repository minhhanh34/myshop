import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_grid.dart';

enum FilterOptions { favorite, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      body: ProductsGrid(
        _showOnlyFavorites,
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      onPressed: () {
        print('Go to cart screen');
      },
      icon: const Icon(Icons.shopping_cart),
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorite) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: FilterOptions.favorite,
          child: Text('Only Favorite'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show all'),
        ),
      ],
    );
  }
}

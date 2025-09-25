import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/views/home/components/wishlist_manager.dart';

class FavButton extends StatefulWidget {
  final ProductsModel product;

  const FavButton({super.key, required this.product});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = WishlistManager.isFavorite(widget.product);

    return IconButton(
      onPressed: () {
        setState(() {
          WishlistManager.toggleProduct(widget.product);
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
        size: 30,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';

class FavButton extends StatelessWidget {
  final ProductsModel product;

  const FavButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isFavorite;

    return IconButton(
        onPressed: () {
          if (isFavorite = true) {
            //to do dari provider untuk memutuskan dia warna apa dan masuk kemana
          } else {
            //todo masukkan kode untuk logika menambahkan item wishlist
          }
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      );
  }
}
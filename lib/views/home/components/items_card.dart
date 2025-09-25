import 'package:flutter/material.dart';
import 'package:owala_app/detail/components/fav_button.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/const.dart';

class ItemsCard extends StatelessWidget {
  final ProductsModel product;
  final VoidCallback press;

  const ItemsCard({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FavButton(
                  product: product,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(product.image),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.getFormattedPrice(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/const.dart';

class AddToCart extends StatelessWidget {
  final ProductsModel product;
  final int quantity;


  const AddToCart({super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: product.color),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)
                ),
              ),
              onPressed: () {
                // TODO 2: direct button buy now ke halaman cart
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: 
                    Text("${product.title} is purchased"),
                    duration: Duration(seconds: 2),
                  )
                );
              },
               child: Text(
                "Add To Cart",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
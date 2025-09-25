import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductsModel {
  final String image, title, material;
  final int price;
  final int id;
  final double height;
  final double width; 
  final Color color;

  ProductsModel({
    required this.image,
    required this.title,
    required this.price,
    required this.height,
    required this.width,
    required this.material,
    required this.id,
    required this.color,
  });

  String getFormattedPrice() {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(price);
  }
}

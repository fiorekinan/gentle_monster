import 'package:flutter/material.dart';
import 'package:owala_app/detail/components/color_picker.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/const.dart';

class ColorAndSize extends StatelessWidget {
  final ProductsModel product;

  const ColorAndSize({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      ColorPicker(color: Color.fromARGB(255, 0, 0, 0), isSelected: true),
                      ColorPicker(color: Color(0xFFAEB89F), isSelected: false),
                      ColorPicker(color: Color(0xFF82848A), isSelected: false),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: defaultPadding),

        // ===== SPECS =====
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSpec("Height", "${product.height} cm"),
            _buildDivider(),
            _buildSpec("Width", "${product.width} cm"),
            _buildDivider(),
            _buildSpec("Material", product.material)
          ],
        ),
      ],
    );
  }

  static Widget _buildSpec(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  static Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.black26,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

List<Map<String, dynamic>> categories = [
  {"icon": "assets/images/glasses.png", "text": "Glasses"},
  {"icon": "assets/images/sunglasses.png", "text": "Sunglasses"},
  {"icon": "assets/images/charms.png", "text": "Charms"},
  {"icon": "assets/images/gifts.png", "text": "Gifts"},
];

int selectedIndex = 0;

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 0.8,
                    color: primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            height: 100, //kasih height biar ga overflow
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => _buildCategory(index),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 80, // dikasih width biar sejajar
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: productColor,
                shape: BoxShape.circle,
              ),
              child: categories[index]["icon"] is IconData
                  ? Icon(
                      categories[index]["icon"],
                      color: selectedIndex == index
                          ? primaryColor
                          : secondaryColor,
                      size: 22,
                    )
                  : Image.asset(
                      categories[index]["icon"],
                      width: 50,
                      height: 50,
                    ),
            ),
            const SizedBox(height: 6),
            Text(
              categories[index]["text"],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

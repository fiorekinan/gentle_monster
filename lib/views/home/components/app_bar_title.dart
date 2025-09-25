import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String screenType;

  const AppBarTitle({super.key, required this.screenType});

  @override
  Widget build(BuildContext context) {
    String line2 = "";
    String line3 = "For Today?";

    if (screenType == "catalogue") {
      line2 = "What are you looking";
    } else if (screenType == "wishlist") {
      line2 = "What do you wish";
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hello,",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          Text(
            line2,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Text(
            line3,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

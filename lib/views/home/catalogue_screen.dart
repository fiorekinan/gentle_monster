import 'package:flutter/material.dart';
import 'package:gentle_monster_app/utils/const.dart';
import 'package:gentle_monster_app/views/home/components/app_bar_title.dart';
import 'package:gentle_monster_app/views/home/components/banner_slider.dart';
import 'package:gentle_monster_app/views/home/components/categories.dart';
import 'package:gentle_monster_app/views/home/components/drinkware_grid.dart';
import 'package:gentle_monster_app/views/home/wishlist_screen.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = 0;
      });
    } else if (index == 1) {
      // pindah ke WishlistScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WishlistScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 110,
        titleSpacing: 16,
        title: const AppBarTitle(screenType: "catalogue"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerSlider(),
            const SizedBox(height: 15),
            Categories(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "12",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.1,
                      ),
                      children: const [
                        TextSpan(text: "New\n"),
                        TextSpan(text: "Glasses"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            DrinkwareGrid(),
          ],
        ),
      ),
    );
  }
}

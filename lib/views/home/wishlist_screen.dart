import 'package:flutter/material.dart';
import 'package:gentle_monster_app/models/products_model.dart';
import 'package:gentle_monster_app/views/home/catalogue_screen.dart';
import 'package:gentle_monster_app/views/home/components/app_bar_title.dart';
import 'package:gentle_monster_app/views/home/components/bottom_nav_bar.dart';
import 'package:gentle_monster_app/views/home/components/items_card.dart';
import 'package:gentle_monster_app/views/home/components/wishlist_manager.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedIndex = 1; // 0 kan buat catalogue, 1 ini buat wishlist

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wishlist = WishlistManager.wishlist;

    final List<Widget> _widgetOptions = [
      const CatalogueScreen(),
      wishlist.isEmpty
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/gm_wishlist.png",
                height: 200,
                width: 200,
                ),
              const Center(
                  child: Text(
                    'You have nothing in your wishlist, yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
            ],
          )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: wishlist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  ProductsModel product = wishlist[index];
                  return ItemsCard(
                    product: product,
                    press: () {
                      Navigator.pushNamed (
                        context,
                        '/detail',
                        arguments: product,
                      );
                    },
                  );
                },
              ),
            ),
    ];

    return Scaffold(
      appBar: _selectedIndex == 1
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 110,
              titleSpacing: 16,
              title: const AppBarTitle(screenType: "wishlist"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none,
                      color: Colors.black),
                  onPressed: () {},
                ),
              ],
            )
          : null,
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

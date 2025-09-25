import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/views/home/components/app_bar_title.dart';
import 'package:owala_app/views/home/components/banner_slider.dart';
import 'package:owala_app/views/home/components/categories.dart';
import 'package:owala_app/views/home/components/drinkware_grid.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 110,
              titleSpacing: 16, // ini tuh biar jaraknya sama antar screen
              title: const AppBarTitle(screenType: "catalogue"),
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
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerSlider(),
                  const SizedBox(height: 15),
                  Categories(),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding),
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
            )
          : _widgetOptions[_selectedIndex - 1],
    );
  }
}

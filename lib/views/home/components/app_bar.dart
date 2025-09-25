import 'package:flutter/material.dart';
import 'package:owala_app/views/home/components/app_bar_title.dart';

class CatalogueAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatalogueAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: const AppBarTitle(screenType: "catalogue"), 
      titleSpacing: 0,
      toolbarHeight: 100,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

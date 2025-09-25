import 'package:flutter/material.dart';
import 'package:gentle_monster_app/detail/detail_screen.dart';
import 'package:gentle_monster_app/models/products_model.dart';
import 'package:gentle_monster_app/utils/const.dart';
import 'package:gentle_monster_app/views/auth/login_screen.dart';
import 'package:gentle_monster_app/views/auth/register_screen.dart';
import 'package:gentle_monster_app/views/home/catalogue_screen.dart';
import 'package:gentle_monster_app/views/home/main_screen.dart';
import 'package:gentle_monster_app/views/home/wishlist_screen.dart';
import 'package:gentle_monster_app/views/onboarding/onboarding_screen.dart';

void main(List<String> args) {
  runApp(GentleMonsterApp());
}

class GentleMonsterApp extends StatefulWidget {
  const GentleMonsterApp ({super.key});

  @override
  State<GentleMonsterApp> createState() => _GentleMonsterState();
}

class _GentleMonsterState extends State<GentleMonsterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Gentle Monster",
  theme: ThemeData(
    fontFamily: 'Sf Pro Display',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: textColor),
      bodySmall: TextStyle(color: textColor),
    ),
    scaffoldBackgroundColor: Colors.white,
  ),
  initialRoute: '/catalogue',
  routes: {
    '/onboarding': (context) => OnboardingScreen(),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/main': (context) => const MainScreen(),
    '/catalogue': (context) => const CatalogueScreen(),
    '/wishlist': (context) => const WishlistScreen(),
    '/detail': (context) => DetailScreen(
      product: ModalRoute.of(context)!.settings.arguments as ProductsModel,
    ),
  },
);
  }
}
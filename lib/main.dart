import 'package:flutter/material.dart';
import 'package:owala_app/detail/detail_screen.dart';
import 'package:owala_app/models/products_model.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/views/auth/login_screen.dart';
import 'package:owala_app/views/auth/register_screen.dart';
import 'package:owala_app/views/home/catalogue_screen.dart';
import 'package:owala_app/views/home/main_screen.dart';
import 'package:owala_app/views/home/wishlist_screen.dart';
import 'package:owala_app/views/onboarding/onboarding_screen.dart';

void main(List<String> args) {
  runApp(OwalaApp());
}

class OwalaApp extends StatefulWidget {
  const OwalaApp({super.key});

  @override
  State<OwalaApp> createState() => _OwalaAppState();
}

class _OwalaAppState extends State<OwalaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Owala App",
  theme: ThemeData(
    fontFamily: 'Sf Pro Display',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: textColor),
      bodySmall: TextStyle(color: textColor),
    ),
    scaffoldBackgroundColor: Colors.white,
  ),
  initialRoute: '/onboarding',
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
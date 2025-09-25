import 'package:flutter/material.dart';
import 'package:owala_app/utils/size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          // The main heading text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: getProporsionateScreenWidth(40),
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/glasses_gm.png',
              fit: BoxFit.contain,
              width: screenWidth * 1.1,
            ),
          ),
          SizedBox(height: 50,),
            Center(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/images/gm_logo.png',
                height: getProporsionateScreenWidth(50),
              ),
                        ),
            ),
        ],
      ),
    );
  }
}
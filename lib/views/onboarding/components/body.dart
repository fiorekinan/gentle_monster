import 'package:flutter/material.dart';
import 'package:owala_app/data/onboarding_data.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/views/onboarding/components/boarding_content.dart';
import 'package:owala_app/views/onboarding/onboarding_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  //maksud dari kode ini adalah untuk memberitahu
                  //setiap kali ada perubahan di satu objek atau halaman yang
                  //di trigger oleh adanya interaksi dari pengguna
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  text: onboardingData[index].text,
                  image: onboardingData[index].image,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => _dotsIndicator(index: index),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                   if (currentPage == onboardingData.length - 1 ) {
                     Navigator.pushNamed(context, '/login');
                   } else {
                     _pageController.animateToPage(
                      currentPage + 1,
                      duration: animationDuration,
                      curve: Curves.ease
                     );
                   }
                  },
                  // currentPage == 3 - 1 ?
                  child: Text(
                    currentPage == onboardingData.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      width: currentPage == index ? 20 : 7,
      height: 5,
      duration: animationDuration,
    );
  }
}

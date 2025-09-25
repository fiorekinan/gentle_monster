import 'package:flutter/material.dart';
import 'package:gentle_monster_app/utils/size_config.dart';
import 'package:gentle_monster_app/views/onboarding/components/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: Body());
  }
}
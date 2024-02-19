import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "J",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Icon(
              Iconsax.search_status,
              size: 24,
              color: Color.fromRGBO(51, 102, 255, 1),
            ),
            Text(
              "BSQUE",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),

      nextScreen: OnboardingScreen(),

      // pageTransitionType: PageTransitionType.scale,
    );
  }
}

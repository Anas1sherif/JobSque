import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Screens/RootScreen/Root_provider.dart';
import 'package:jobsque/Screens/Splash_screen/Splash_Screen.dart';
import 'package:jobsque/Screens/login_screens/login_screen.dart';
import 'package:jobsque/Screens/onboarding_screen/onboarding_screen.dart';
import 'package:jobsque/widget/Bottom_Navigation_Bar.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(rootProvider).when(
        data: (data) {
          switch (data) {
            case "first-time":
              return const OnboardingScreen();
            case "login-screen":
              return const LoginScreen();
            case "home-screen":
              return BootomNavigator();

            default:
              return const LoginScreen();
          }

          // if (data == "first-time") {
          //   return const OnboardingScreen();
          // } else {
          //
          // }
        },
        error: (e, s) => const Scaffold(
                body: Center(
              child: Text("you have error "),
            )),
        loading: () => const SplashScreen());
  }
}

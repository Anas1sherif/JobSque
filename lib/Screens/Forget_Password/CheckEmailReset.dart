import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/Screens/Forget_Password/Resetpassword.dart';

class CheckEmailResetScreen extends StatelessWidget {
  const CheckEmailResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
            ),
            SvgPicture.asset(
                "assets/images/onboarding_screen_images/Email Ilustration.svg"),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Check your Email",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "We have sent a reset password to your email address",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(107, 114, 128, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 340),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RestPassword()));
                },
                child: const Text(
                  "Open email app",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(360, 48),
                    backgroundColor: const Color.fromRGBO(51, 102, 255, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

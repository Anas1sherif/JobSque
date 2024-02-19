import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessAccountScreen extends StatelessWidget {
  const SuccessAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SvgPicture.asset(
                  "assets/images/create_account_images/Success Account Ilustration.svg"),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Your account has been set up!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "We have customized feeds according to your preferences",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(107, 114, 128, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 345),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SuccessAccountScreen(),
                  //   ),
                  // );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 48),
                    backgroundColor: const Color.fromRGBO(51, 102, 255, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

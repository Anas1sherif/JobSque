import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/Screens/profile/screen/Tow_step_verification/thired_screen.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';
import 'package:jobsque/widget/Custom_text_failed.dart';

class TwostepVerifySecoundScreen extends StatefulWidget {
  const TwostepVerifySecoundScreen({super.key});

  @override
  State<TwostepVerifySecoundScreen> createState() =>
      _TwostepVerifySecoundScreenState();
}

class _TwostepVerifySecoundScreenState
    extends State<TwostepVerifySecoundScreen> {
  final TextEditingController _passwordsController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isVisible = true;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Two-step verification",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add phone number",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "We will send a verification code to this number",
              style: TextStyle(color: Color(0xff6B7280)),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            IntlPhoneField(
              controller: _phoneController,
              languageCode: "en",
              keyboardType: TextInputType.number,
              showCountryFlag: true,
              showDropdownIcon: true,
              dropdownIconPosition: IconPosition.trailing,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter your password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                controller: _passwordsController,
                prefixIcons: Icon(Iconsax.lock),
                suffixIcons: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(
                    isVisible ? Iconsax.eye_slash : Iconsax.eye,
                    color: const Color(0xff9ca3af),
                  ),
                ),
                isPass: isVisible),
            const Spacer(),
            CustomElvatedButton(
              onpress: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => TwostepVerifyThiredScreen(),
                    ),
                    (route) => false);
              },
              text: const Text("Send Code"),
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable



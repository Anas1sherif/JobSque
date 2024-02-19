import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/widget/Custom_text_failed.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });
  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController phoneController;
  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Biodata",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Fill in your bio data correctly",
          style: TextStyle(
            color: Color(
              0xff6B7280,
            ),
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: "Full Name "),
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          cursorColor: const Color.fromARGB(255, 216, 114, 114),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Require';
            } else {
              return null;
            }
          },
          prefixIcons: const Icon(Iconsax.user),
          controller: widget.nameController,
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: "Email "),
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextField(
          cursorColor: const Color.fromARGB(255, 216, 114, 114),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This Field is Require';
            } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
              return 'Enter a Correct Email';
            } else {
              return null;
            }
          },
          prefixIcons: const Icon(Iconsax.sms),
          controller: widget.emailController,
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: "No.Handphone "),
                TextSpan(text: "*", style: TextStyle(color: Colors.red))
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
        IntlPhoneField(
          languageCode: "en",
          keyboardType: TextInputType.number,
          showCountryFlag: true,
          showDropdownIcon: true,
          dropdownIconPosition: IconPosition.trailing,
        ),
      ]),
    );
  }
}

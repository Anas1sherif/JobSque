import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});
  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();

  bool isSelected = false;
  String? phone = "20";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Consumer(builder: (context, ref, _) {
          // widget._phoneController.text =
          //     ref.read(providerr).user!.phone ?? "".trim();
          _phoneController.text = ref.read(jobsqueprov).user!.phone ?? "";
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Main phone number",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IntlPhoneField(
                languageCode: "en",
                keyboardType: TextInputType.number,
                showCountryFlag: true,
                showDropdownIcon: true,
                dropdownIconPosition: IconPosition.trailing,
              ),
              const SizedBox(
                height: 10,
              ),
              SwitchListTile.adaptive(
                title: const Text(
                  "Use the phone number to reset your password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                  ),
                ),
                value: isSelected,
                onChanged: (value) {
                  setState(
                    () {
                      isSelected = value;
                    },
                  );
                },
              ),
              const Spacer(),
              CustomElvatedButton(
                onpress: () {
                  ref.read(jobsqueprov).user!.phone = _phoneController.text;
                  ref.watch(jobsqueprov).editUser();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("changed successfully")));
                  Navigator.of(context).pop();
                },
                text: const Text("Save"),
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          );
        }),
      ),
    );
  }
}

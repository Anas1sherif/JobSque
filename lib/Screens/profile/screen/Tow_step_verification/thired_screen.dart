import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Screens/profile/screen/Tow_step_verification/widget/custom_otp.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/Bottom_Navigation_Bar.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';

class TwostepVerifyThiredScreen extends StatefulWidget {
  TwostepVerifyThiredScreen({super.key});
  // final TextEditingController _phoneController = TextEditingController();
  @override
  State<TwostepVerifyThiredScreen> createState() =>
      _TwostepVerifyThiredScreenState();
}

class _TwostepVerifyThiredScreenState extends State<TwostepVerifyThiredScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool isVisible = true;
  bool isSelected = true;
  String? dialingCode = "20";
  final formKey = GlobalKey<FormState>();

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
              "Enter the 6 digit code",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please confirm your account by entering the authorization code sen to ****-****-7234",
              style: TextStyle(color: Color(0xff6B7280)),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: CustomOTP(pinController: _otpController),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Consumer(builder: (context, ref, _) {
              return CustomElvatedButton(
                onpress: () {
                  formKey.currentState!.validate();

                  print(_otpController.text);
                  ref.read(jobsqueprov).verifyde();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //       builder: (context) => ProfileScreen(),
                  //     ),
                  //     (route) => false);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("is Avtive")));
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BootomNavigator(selectedIndex: 4),
                  ));
                },
                text: const Text("Send Code"),
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              );
            })
          ],
        ),
      ),
    );
  }
}

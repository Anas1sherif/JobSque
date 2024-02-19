import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/profile/screen/Tow_step_verification/second_screen.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';

class TwostepVerifyFirstScreen extends StatefulWidget {
  const TwostepVerifyFirstScreen({super.key, required this.isShacked});
  final bool isShacked;

  @override
  State<TwostepVerifyFirstScreen> createState() =>
      _TwostepVerifyFirstScreenState();
}

class _TwostepVerifyFirstScreenState extends State<TwostepVerifyFirstScreen> {
  late bool isShacked = widget.isShacked;
  List listVerify = [
    "Telephone number (SMS)",
    " Message in Email",
  ];
  late String? whichVerification = listVerify[0];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Two-step verification",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Consumer(builder: (context, ref, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SwitchListTile.adaptive(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(
                    color: Color(0xffD1D5DB),
                  ),
                ),
                title: const Text(
                  "Secure your account with two-step verification",
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: isShacked,
                onChanged: (value) {
                  setState(() {
                    isShacked = value;
                  });
                },
              ),
              const SizedBox(
                height: 32,
              ),
              isShacked
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Select a verification method",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xffD1D5DB),
                            ),
                          ),
                          height: 56,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                borderRadius: BorderRadius.circular(12),
                                isDense: true,
                                icon: const SizedBox(),
                                isExpanded: true,
                                value: whichVerification,
                                onChanged: (value) {
                                  setState(() {
                                    whichVerification = value;
                                  });
                                },
                                items: listVerify.map<DropdownMenuItem<String>>(
                                  (value) {
                                    return DropdownMenuItem(
                                        value: value,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              value,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Spacer(),
                                            Icon(Iconsax.arrow_down_14)
                                          ],
                                        ));
                                  },
                                ).toList()),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6B7280),
                          ),
                          strutStyle: StrutStyle(height: 1.3),
                        ),
                      ],
                    )
                  : const Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffD6E4FF),
                              child: Icon(
                                Iconsax.lock,
                                color: Color(0xff3d6eff),
                              )),
                          title: Text(
                            "Two-step verification provides additional security by asking for a verification code every time you log in on another device.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff6B7280),
                            ),
                            strutStyle: StrutStyle(height: 1.3),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xffD6E4FF),
                              child: Icon(
                                Iconsax.external_drive,
                                color: Color(0xff3d6eff),
                              )),
                          title: Text(
                            "Adding a phone number or using an authenticator will help keep your account safe from harm.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff6B7280),
                            ),
                            strutStyle: StrutStyle(height: 1.3),
                          ),
                        ),
                      ],
                    ),
              const Spacer(),
              CustomElvatedButton(
                onpress: () {
                  if (!widget.isShacked) {
                    //false
                    if (isShacked) {
                      //true
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TwostepVerifySecoundScreen()));
                    }
                  } else {
                    if (!isShacked) {
                      //true
                      ref.watch(jobsqueprov).verifyde();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("is Not Avtive")));
                      Navigator.of(context).pop();
                    }
                  }
                },
                text:
                    widget.isShacked ? const Text("Save") : const Text("Next"),
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

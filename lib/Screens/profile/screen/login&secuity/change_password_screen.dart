import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';
import 'package:jobsque/widget/Custom_text_failed.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isOldPassVis = true;
  bool isNewPassVis = true;
  bool isConfirmPassVis = true;
  AppBar appbar = AppBar(
    title: const Text("Change password"),
  );
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appbar.preferredSize.height;
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Container(
          height: pageSize - (appBarSize + notifySize),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Enter your old password",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  controller: _oldPasswordController,
                  prefixIcons: Icon(Iconsax.lock),
                  suffixIcons: GestureDetector(
                    onTap: () {
                      setState(() {
                        isOldPassVis = !isOldPassVis;
                      });
                    },
                    child: Icon(
                      isOldPassVis ? Iconsax.eye_slash : Iconsax.eye,
                      color: const Color(0xff9ca3af),
                    ),
                  ),
                  isPass: isOldPassVis),

              const SizedBox(
                height: 20,
              ),
              const Text("Enter your new password",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  controller: _newPasswordController,
                  prefixIcons: Icon(Iconsax.lock),
                  suffixIcons: GestureDetector(
                    onTap: () {
                      setState(() {
                        isNewPassVis = !isNewPassVis;
                      });
                    },
                    child: Icon(
                      isNewPassVis ? Iconsax.eye_slash : Iconsax.eye,
                      color: const Color(0xff9ca3af),
                    ),
                  ),
                  isPass: isNewPassVis),
              const SizedBox(
                height: 20,
              ),
              //////////////////////////////
              const Text("Confirm your new password",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  controller: _confirmPasswordController,
                  prefixIcons: Icon(Iconsax.lock),
                  suffixIcons: GestureDetector(
                    onTap: () {
                      setState(() {
                        isConfirmPassVis = !isConfirmPassVis;
                      });
                    },
                    child: Icon(
                      isConfirmPassVis ? Iconsax.eye_slash : Iconsax.eye,
                      color: const Color(0xff9ca3af),
                    ),
                  ),
                  isPass: isConfirmPassVis),

              const Expanded(
                child: SizedBox(
                    // height: 250,
                    ),
              ),
              Consumer(builder: (context, ref, _) {
                return CustomElvatedButton(
                  onpress: () {
                    if (_newPasswordController.text ==
                        _confirmPasswordController.text) {
                      ref.read(jobsqueprov).user?.password =
                          _newPasswordController.text;
                      ref.watch(jobsqueprov).changePassword();
                      Navigator.of(context).pop();
                    } else {}
                  },
                  text: const Text("Save"),
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

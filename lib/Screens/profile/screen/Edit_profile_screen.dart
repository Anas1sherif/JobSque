import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';
import 'package:jobsque/widget/Custom_text_failed.dart';

// ignore: must_be_immutable
class EditProfileScreen extends ConsumerWidget {
  EditProfileScreen({
    super.key,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool first = true;
  AppBar appBar = AppBar(
    title: const Text('Edit Profile'),
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageSize = MediaQuery.of(context).size.height;
    var notifySize = MediaQuery.of(context).padding.top;
    var appBarSize = appBar.preferredSize.height;
    if (first) {
      final prov = ref.read(jobsqueprov);
      _nameController.text = ref.watch(jobsqueprov).user!.name!;
      _bioController.text = prov.user!.bio ?? "";
      _adressController.text = prov.user!.address ?? "";
      _phoneController.text = prov.user!.phone ?? "";
      first = false;
    }
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          height: pageSize - (appBarSize + notifySize),
          child: Consumer(
            builder: (context, ref, _) {
              final prov = ref.watch(jobsqueprov);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: Stack(
                          children: [
                            Image.asset("assets/images/imagepicker/anas.jpg")
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      prov.selectImage();
                    },
                    child: const Text(
                      "Change  Photo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff3366FF)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff9CA3AF))),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(controller: _nameController),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Bio",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff9CA3AF))),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(controller: _bioController),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff9CA3AF))),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(controller: _adressController),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("No.Handphone",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff9CA3AF))),
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
                  Expanded(
                    child: const SizedBox(
                        // height: 173,
                        ),
                  ),
                  CustomElvatedButton(
                    text: const Text("Save",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                    onpress: () {
                      ref.read(jobsqueprov).user!.name = _nameController.text;

                      ref.read(jobsqueprov).user!.bio = _bioController.text;

                      ref.read(jobsqueprov).user!.address =
                          _adressController.text;

                      ref.read(jobsqueprov).user!.phone = _phoneController.text;

                      print(ref.read(jobsqueprov).user!.bio!.isEmpty);
                      ref.read(jobsqueprov).editUser();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("changed successfully")));
                      Navigator.of(context).pop();
                    },
                    color: const Color(0xff3366FF),
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

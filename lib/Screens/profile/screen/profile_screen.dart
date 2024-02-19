import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/login_screens/login_screen.dart';
import 'package:jobsque/Screens/profile/Profile_item.dart';
import 'package:jobsque/Screens/profile/screen/Edit_profile_screen.dart';
import 'package:jobsque/Screens/profile/screen/Help_center.dart';
import 'package:jobsque/Screens/profile/screen/Login_and_security_screen.dart';
import 'package:jobsque/Screens/profile/screen/Notification_screen.dart';
import 'package:jobsque/Screens/profile/screen/Portoflio_screen.dart';
import 'package:jobsque/Screens/profile/screen/Privacy_screen.dart';
import 'package:jobsque/Screens/profile/screen/languages.dart';
import 'package:jobsque/Screens/profile/screen/trems_and_conditions.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leading: Icon(Iconsax.arrow_left),
            backgroundColor: const Color(0xffd6e4ff),
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            actions: [
              Consumer(
                builder: (context, ref, _) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(jobsqueprov).logOut();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                    },
                    child: Icon(
                      Iconsax.logout_1,
                      color: Color.fromRGBO(255, 71, 43, 1),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
        body: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, _) {
              final prov = ref.watch(jobsqueprov);

              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: const Color(0xffd6e4ff),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 24, left: 24, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(0), // Border radius
                                  child: ClipOval(
                                      child: Image.asset(
                                          "assets/images/imagepicker/anas.jpg")),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            prov.user == null
                                ? const Align(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator())
                                : Column(
                                    children: [
                                      Text(
                                        prov.user!.name!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        prov.user!.bio ?? "",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff6B7280)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Applied",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "46",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Reviewed",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "46",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                  child: VerticalDivider(
                                    width: 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Contacted",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "46",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "About",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      context: context,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 15,
                                                  left: 15,
                                                  top: 30,
                                                  bottom: 20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  const Text(
                                                    "About",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  TextField(
                                                    autofocus: true,
                                                    controller:
                                                        _aboutController,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ), // const Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 120),
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                        ),
                                                        backgroundColor:
                                                            const Color(
                                                                0xff3366FF),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {});
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text("Save"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff3366FF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              _aboutController.text,
                              strutStyle: const StrutStyle(height: 1.5),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20),
                        color: const Color(0xffE5E7EB),
                        width: double.infinity,
                        height: 40,
                        child: const Text(
                          "General",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            ProfileItem(
                              icon: Iconsax.user,
                              withicon: true,
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(),
                                  ),
                                );
                              },
                              title: "Edit Profile",
                            ),
                            ProfileItem(
                              icon: Iconsax.folder_favorite,
                              withicon: true,
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PortfolioScreen(),
                                  ),
                                );
                              },
                              title: "Portfolio",
                            ),
                            ProfileItem(
                              icon: Iconsax.global,
                              withicon: true,
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LanguageScreen(),
                                  ),
                                );
                              },
                              title: "Langauge",
                            ),
                            ProfileItem(
                              icon: Iconsax.notification,
                              withicon: true,
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationEditSCreen(),
                                  ),
                                );
                              },
                              title: "Notification",
                            ),
                            ProfileItem(
                              icon: Iconsax.lock,
                              withicon: true,
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LoginAndSecurityScreen(),
                                  ),
                                );
                              },
                              title: "Login and security",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20),
                        color: const Color(0xffE5E7EB),
                        width: double.infinity,
                        height: 40,
                        child: const Text(
                          "Others",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff6B7280)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            ProfileItem(
                              ontap: () {},
                              title: "Accesibility",
                            ),
                            ProfileItem(
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpCenterScreen(),
                                  ),
                                );
                              },
                              title: "Help Center",
                            ),
                            ProfileItem(
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsAndConditionsScreen(),
                                  ),
                                );
                              },
                              title: "Terms & Conditions",
                            ),
                            ProfileItem(
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyAndPolicyScreen(),
                                  ),
                                );
                              },
                              title: "Privacy Policy",
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

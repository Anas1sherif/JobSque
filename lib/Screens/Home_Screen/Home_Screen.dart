import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Filter_Search/search_screen.dart';
import 'package:jobsque/Screens/notifacation/Notification_Screen.dart';
import 'package:jobsque/Screens/Home_Screen/Resent_Job_Screen.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomChip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Consumer(
              builder: (context, ref, _) {
                if (ref.watch(jobsqueprov).user == null) {
                  ref.watch(jobsqueprov).getUser();
                }
                return Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ref.read(jobsqueprov).user == null
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    "Hi, ${ref.read(jobsqueprov).user?.name!.split(" ")[0]}👋",
                                    // "Hi, ${widget.user.name}👋",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                    ),
                                  ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Create a better future for yourself here",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff6B7280)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationScreen()));
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(Iconsax.notification),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 12),
                        height: 48,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffD1D5DB)),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            Icon(Iconsax.search_normal),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              "Search....",
                              style: TextStyle(color: Color(0xff9CA3AF)),
                            )
                          ],
                        ), // width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Suggested Job",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff3366FF)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomCard(
                            colortext: Colors.white,
                            textj: "Product Designer",
                            textl: "Zoom • United States",
                            svgimage: 'assets/images/icon_images/Zoom Logo.svg',
                            colorsizedbox: Color.fromRGBO(9, 26, 122, 1),
                          ),
                          CustomCard(
                            colortext: Colors.white,
                            textj: "Product Designer",
                            textl: "Zoom • United States",
                            svgimage:
                                'assets/images/icon_images/Slack Logo.png',
                            colorsizedbox: Color.fromRGBO(9, 26, 122, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Recent  Job",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RecentJopScreen(),
                          )),
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xff3366FF)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ref.watch(jobsqueprov).home.isEmpty
                        ? Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: const Center(
                                      child: CircularProgressIndicator())),
                            ],
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                ref.watch(jobsqueprov).home[index],
                            separatorBuilder: (context, index) => const Divider(
                                  thickness: 1.5,
                                ),
                            itemCount: ref.watch(jobsqueprov).home.length)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String svgimage;
  final Color colorsizedbox;
  final Color colortext;
  final String textj;
  final String textl;

  const CustomCard({
    super.key,
    required this.svgimage,
    required this.colorsizedbox,
    required this.textj,
    required this.textl,
    required this.colortext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 350,
      child: Card(
        color: Color(colorsizedbox.value),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/images/icon_images/Zoom Logo.svg"),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textj,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: colortext),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        textl,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9CA3AF)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Iconsax.archive_minus)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  CustomChip(
                    text: "Fulltime",
                    chipColor: Colors.white24,
                    textColor: Colors.white,
                  ),
                  CustomChip(
                    text: "Remote",
                    chipColor: Colors.white24,
                    textColor: Colors.white,
                  ),
                  CustomChip(
                    text: "Senior",
                    chipColor: Colors.white24,
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$12K-15K",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: colortext),
                    ),
                    Text(
                      "/Month",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colortext),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(51, 102, 255, 1),
                          fixedSize: Size(120, 25)),
                      onPressed: () {},
                      child: Text(
                        'Apply now',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Maasege/Widget/message_items.dart';
import 'package:jobsque/model/company_model.dart';
import 'package:jobsque/widget/custom_search.dart';

class HomeMessageScreen extends StatefulWidget {
  const HomeMessageScreen({super.key});

  @override
  State<HomeMessageScreen> createState() => _HomeMessageScreenState();
}

class _HomeMessageScreenState extends State<HomeMessageScreen> {
  final TextEditingController searchController = TextEditingController();

  List nameOfCompany = [
    "Twitter",
    "Gojek Indonesia",
    "Shoope",
    "Dana",
    "Slack",
    "Facebook",
  ];

  List imageOfCompany = [
    "assets/images/icon_images/Twitter Logo.png",
    "assets/images/icon_images/Gojek Logo.png",
    "assets/images/icon_images/Shoope Logo.png",
    "assets/images/icon_images/Dana Logo.png",
    "assets/images/icon_images/Slack Logo.png",
    "assets/images/icon_images/Facebook Logo.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Messsages'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSearch(
                  searchController: searchController,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          height: 300,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Message filters",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const BottomSheetItem(
                                    title: "Unread",
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const BottomSheetItem(
                                    title: "Spam",
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const BottomSheetItem(
                                    title: "Archived",
                                  ),
                                ),
                              ]),
                        );
                      },
                    );
                  },
                  child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(Iconsax.setting_4)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              // height: 200,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  indent: 70,
                  endIndent: 3,
                  thickness: 1,
                ),
                itemCount: nameOfCompany.length,
                itemBuilder: (context, index) => MessageItems(
                  company: Company(
                    name: nameOfCompany[index],
                    image: imageOfCompany[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xffD1D5DB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Iconsax.arrow_right_14)
          ],
        ),
      ),
    );
  }
}

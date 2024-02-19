import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/createAccount_Screens/choosejob_screen.dart';
import 'package:jobsque/Screens/createAccount_Screens/widget/item_intersted.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';

class WorkInterestedScreen extends StatelessWidget {
  const WorkInterestedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "What type of work are you interested in?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Tell us what you’re interested in so we can customise the app for your needs.",
                style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 30),
              GridView(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 0.8), crossAxisCount: 2),
                children: const [
                  InterestedItem(
                    interestedName: "UI/UX Designer",
                    interestedeIcon: Iconsax.bezier,
                  ),
                  InterestedItem(
                    interestedName: "Ilustrator Designer",
                    interestedeIcon: Iconsax.pen_tool_2,
                  ),
                  InterestedItem(
                    interestedName: "Developert",
                    interestedeIcon: Iconsax.code,
                  ),
                  InterestedItem(
                    interestedName: "Management",
                    interestedeIcon: Iconsax.graph,
                  ),
                  InterestedItem(
                    interestedName: "Information Technology",
                    interestedeIcon: Iconsax.monitor_mobbile,
                  ),
                  InterestedItem(
                    interestedName: "Research and Analytics",
                    interestedeIcon: Iconsax.cloud_add,
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 60,
              // ),
              const Spacer(),
              CustomElvatedButton(
                text: const Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                onpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChooseJobScreen(),
                  ));
                },
                color: const Color(0xff3366FF),
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}

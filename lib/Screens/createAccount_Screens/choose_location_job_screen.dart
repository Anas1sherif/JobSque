import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/Screens/createAccount_Screens/Success_Account_screen.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';

class ChooseLocationJob extends StatefulWidget {
  const ChooseLocationJob({super.key});

  @override
  State<ChooseLocationJob> createState() => _ChooseLocationJobState();
}

class _ChooseLocationJobState extends State<ChooseLocationJob> {
  int currentText = 0;
  List<String> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 70, left: 25),
                    child: Text(
                      "What type of work are you interested in?",
                      style: TextStyle(
                          fontFamily: "SF PRO",
                          fontSize: 24,
                          color: Color.fromRGBO(17, 24, 39, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 70, left: 25),
                    child: Text(
                      "Tell us what you're interested in so we can customise the app for your needs.",
                      style: TextStyle(
                          color: Color.fromRGBO(115, 1115, 121, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: CustomSlidingSegmentedControl<int>(
                      children: {
                        0: Text(
                          "Work From Office",
                          style: TextStyle(
                              color: currentText == 0
                                  ? Colors.white
                                  : const Color.fromARGB(255, 93, 98, 110)),
                        ),
                        1: Text(
                          "Remote Work",
                          // "   Company   ",
                          style: TextStyle(
                              color: currentText == 1
                                  ? Colors.white
                                  : const Color(0XFF6B7280)),
                        ),
                      },
                      fixedWidth: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0XFFF4F4F5)),
                      thumbDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0XFF091A7A)),
                      // curve: Curves.bounceOut,
                      duration: const Duration(milliseconds: 200),
                      onValueChanged: (index) {
                        setState(() {
                          currentText = index;
                        });
                        // print(currentText);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "Select the country you want for your job",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(115, 115, 121, 1)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      customChip(
                          flag: Image.asset(
                              "assets/images/Flags/unitedstatse.png"),
                          nameOfFlag: "United States"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/malisya.png'),
                          nameOfFlag: "Malaysia"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/sngafora.png'),
                          nameOfFlag: "Singapore"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/indonsia.png'),
                          nameOfFlag: "Indonesia"),
                      customChip(
                          flag: Image.asset(
                              'assets/images/Flags/Philiphines.png'),
                          nameOfFlag: "Philiphines"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/Polandia.png'),
                          nameOfFlag: "Polandia"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/India.png'),
                          nameOfFlag: "India"),
                      customChip(
                          flag: Image.asset('assets/image/flags/Vietnam.png'),
                          nameOfFlag: "Vietnam"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/China.png'),
                          nameOfFlag: "China"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/Canada.png'),
                          nameOfFlag: "Canada"),
                      customChip(
                          flag: Image.asset(
                              'assets/images/Flags/Saudi Arabia.png'),
                          nameOfFlag: "Saudi Arabia"),
                      customChip(
                          flag:
                              Image.asset('assets/images/Flags/Argentina.png'),
                          nameOfFlag: "Argentina"),
                      customChip(
                          flag: Image.asset('assets/images/Flags/Brazil.png'),
                          nameOfFlag: "Brazil"),
                    ],
                  ),
                  const Spacer(),
                  CustomElvatedButton(
                    text: const Text("Next"),
                    onpress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SuccessAccountScreen(),
                      ));
                    },
                    color: const Color(0xff3366FF),
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FilterChip customChip({Image? flag, required String nameOfFlag}) {
    return FilterChip(
      padding: const EdgeInsets.only(top: 8, right: 14, bottom: 8, left: 10),
      side: BorderSide(
        width: 1,
        color: selectedChips.contains(nameOfFlag)
            ? const Color(0xff3366FF)
            : const Color(0xffE5E7EB),
      ),
      backgroundColor: selectedChips.contains(nameOfFlag)
          ? const Color(0xffD6E4FF)
          : const Color(0xffFAFAFA),
      pressElevation: 0,
      label: Text(
        nameOfFlag,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      ),
      // avatar: ,
      avatar: flag,
      onSelected: (bool selected) {
        toggleChipSelection(
            nameOfFlag, selected != selectedChips.contains(nameOfFlag));
      },
    );
  }

  void toggleChipSelection(String chip, bool selected) {
    setState(() {
      if (selected) {
        selectedChips.add(chip);
      } else {
        selectedChips.remove(chip);
      }
    });
  }
}

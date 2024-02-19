import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Maasege/Home_Massage.dart';
import 'package:jobsque/Screens/Applyied_job_screen/Applyed_job_screen.dart';

import 'package:jobsque/Screens/Home_Screen/Home_Screen.dart';
import 'package:jobsque/Screens/Saved_screen/saved_screen.dart';
import 'package:jobsque/Screens/profile/screen/profile_screen.dart';

// ignore: must_be_immutable
class BootomNavigator extends StatefulWidget {
  BootomNavigator({super.key, this.selectedIndex = 0});
  int selectedIndex;
  @override
  State<BootomNavigator> createState() => _BootomNavigatorState();
}

int currentSelectedScreenIndex = 0;
List body = <Widget>[
  const HomeScreen(),
  const HomeMessageScreen(),
  const ApplyidJopScreen(),
  const SavedScreen(),
  const ProfileScreen(),
];

class _BootomNavigatorState extends State<BootomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[widget.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff3366ff),
        selectedFontSize: 12,
        unselectedFontSize: 12,

        // unselectedFontSize: 5,
        onTap: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
        },
        currentIndex: widget.selectedIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white54,
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Icon(
                  widget.selectedIndex == 0 ? Iconsax.home : Iconsax.home,
                  color: widget.selectedIndex == 0
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Icon(
                  widget.selectedIndex == 1 ? Iconsax.message : Iconsax.message,
                  color: widget.selectedIndex == 1
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Icon(
                  widget.selectedIndex == 2
                      ? Iconsax.briefcase
                      : Iconsax.briefcase,
                  color: widget.selectedIndex == 2
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Applied"),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Icon(
                widget.selectedIndex == 3
                    ? Iconsax.archive_minus
                    : Iconsax.archive_minus,
                color: widget.selectedIndex == 3
                    ? const Color(0xff3366ff)
                    : const Color(0xffa2a9b4),
              ),
            ),
            backgroundColor: Colors.black,
            label: "Saved,",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Icon(
                  widget.selectedIndex == 4 ? Iconsax.user : Iconsax.user,
                  color: widget.selectedIndex == 4
                      ? const Color(0xff3366ff)
                      : const Color(0xffa2a9b4),
                ),
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}

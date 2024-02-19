import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/Screens/ApplyJob/ApplyJob_screen.dart';
import 'package:jobsque/Screens/Job_Detail/Job_DetailCompany_Screen.dart';
import 'package:jobsque/Screens/Job_Detail/Job_DetailDescreption_Screen.dart';
import 'package:jobsque/Screens/Job_Detail/Job_Detailpepole_screen.dart';
import 'package:jobsque/model/Jobs_model.dart';
import 'package:jobsque/widget/CustomChip.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';
import 'package:jobsque/widget/Saved_Icon.dart';

class JopDetailScreen extends StatefulWidget {
  const JopDetailScreen({super.key, required this.jobs});
  final Jobs jobs;

  @override
  State<JopDetailScreen> createState() => _JopDetailScreenState();
}

class _JopDetailScreenState extends State<JopDetailScreen> {
  int currentText = 0;
  int pageNumber = 0;
  final PageController _pageController = PageController();
  late List listLocation = widget.jobs.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job Detail"),
        actions: [
          SizedBox(
              width: 30,
              child: SavedIcon(
                jobs: widget.jobs,
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.network(
            widget.jobs.image,
            height: 60,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.jobs.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "${widget.jobs.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChip(
                text: widget.jobs.jobTimeType,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomChip(
                text: widget.jobs.jobType,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Desicription",
                style: TextStyle(
                    color: pageNumber == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Company",
                style: TextStyle(
                    color: pageNumber == 1
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
              2: Text(
                "People",
                style: TextStyle(
                    color: pageNumber == 2
                        ? Colors.white
                        : const Color(0XFF6B7280)),
              ),
            },
            fixedWidth: 107,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFFF4F4F5)),
            thumbDecoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: const Color(0XFF091A7A)),
            duration: const Duration(milliseconds: 200),
            onValueChanged: (index) {
              setState(() {
                pageNumber = index;

                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageNumber = value;
                });
              },
              controller: _pageController,
              children: [
                JopDetailDescreptionScreen(jobs: widget.jobs),
                JopDetailCompanyScreen(jobs: widget.jobs),
                JopDetailPeopleScreen(jobs: widget.jobs)
              ],
            ),
          ),
          CustomElvatedButton(
            text: const Text(
              "Apply now",
              style: TextStyle(color: Colors.white),
            ),
            onpress: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ApplyJopScreen(
                  jobs: widget.jobs,
                ),
              ));
            },
            color: const Color(0xff3366FF),
            textStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

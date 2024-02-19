import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/Screens/ApplyJob/ApplyJob_screen.dart';
import 'package:jobsque/model/Jobs_model.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomChip.dart';
import 'package:jobsque/widget/Saved_Icon.dart';

class ApplyidJopScreen extends StatefulWidget {
  const ApplyidJopScreen({
    super.key,
  });

  @override
  State<ApplyidJopScreen> createState() => _ApplyidJopScreenState();
}

class _ApplyidJopScreenState extends State<ApplyidJopScreen> {
  // int pageNumber = 0;
  int pageNumber = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applied Job"),
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 50,
          child: CustomSlidingSegmentedControl<int>(
            children: {
              0: Text(
                "Active",
                style: TextStyle(
                    color: pageNumber == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
              1: Text(
                "Rejected",
                style: TextStyle(
                    color: pageNumber == 1
                        ? Colors.white
                        : const Color.fromARGB(255, 93, 98, 110)),
              ),
            },

            fixedWidth: 160,
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
            // curve: Curves.bounceOut,
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
        ),
        const SizedBox(
          height: 25,
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
            children: const [
              ActiveApplyidJop(),
              RejectedApplyiedJop(),
            ],
          ),
        ),
      ]),
    );
  }
}

class RejectedApplyiedJop extends StatelessWidget {
  const RejectedApplyiedJop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        right: 15,
        left: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/icon_images/Data Ilustration_rejected.png",
            height: 130,
          ),
          // Spacer(),
          const Text(
            "No applications were rejected",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "If there is an application that is rejected by the company it will appear here",
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveApplyidJop extends StatelessWidget {
  const ActiveApplyidJop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
            color: const Color(0xffE5E7EB),
            width: double.infinity,
            height: 35,
            child: Text(
              "   ${ref.watch(jobsqueprov).activeJob.length} Jops",
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ref.watch(jobsqueprov).activeJob[index],
                  separatorBuilder: (context, index) => const Divider(
                        thickness: 1.5,
                      ),
                  itemCount: ref.watch(jobsqueprov).activeJob.length),
            ),
          )
        ],
      );
    });
  }
}

class AppliedJopItem extends StatefulWidget {
  AppliedJopItem({
    super.key,
    required this.jobs,
  });
  final Jobs jobs;

  @override
  State<AppliedJopItem> createState() => _AppliedJopItemState();
}

class _AppliedJopItemState extends State<AppliedJopItem> {
  int pageNumber = 0;

  late final List listLocation = widget.jobs.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ApplyJopScreen(
                jobs: widget.jobs,
              ),
            ));
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.jobs.image,
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.jobs.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.jobs.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
                          style: const TextStyle(
                            fontSize: 12,
                            // color: Color(0xff374151),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SavedIcon(jobs: widget.jobs)
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomChip(
                        text: widget.jobs.jobTimeType,
                      ),
                      const Spacer(),
                      CustomChip(
                        text: widget.jobs.jobType,
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                      const Text(
                        "Posted 2 days ago",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffD1D5DB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Column(
                            children: [
                              pageNumber > 0
                                  ? Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff3366FF),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: const Center(
                                          child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    )
                                  : Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff9CA3AF)),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: Color(0xff9CA3AF),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Biodata",
                                style: TextStyle(
                                  color: pageNumber > 0
                                      ? const Color(0xff3366FF)
                                      : Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: DottedLine(
                              lineLength: 30,
                              dashColor: pageNumber >= 1
                                  ? const Color(0xff3366FF)
                                  : Colors.black),
                        ),
                        Column(
                          children: [
                            pageNumber >= 2
                                ? Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff3366FF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Center(
                                        child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  )
                                : Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: pageNumber >= 2
                                              ? const Color(0xff3366FF)
                                              : const Color(0xff9CA3AF)),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            // color: pageNumber >= 1
                                            //     ? const Color(0xff3366FF)
                                            //     : const Color(
                                            //         0xff9CA3AF,
                                            color: Color(
                                              0xff9CA3AF,
                                            ),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Type of work",
                              style: TextStyle(
                                color: pageNumber > 1
                                    ? const Color(0xff3366FF)
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 60,
                          child: DottedLine(
                              lineLength: 30,
                              dashColor: pageNumber > 1
                                  ? const Color(0xff3366FF)
                                  : Colors.black),
                        ),
                        Column(
                          children: [
                            pageNumber > 2
                                ? Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff3366FF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Center(
                                        child: Text(
                                      "3",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  )
                                : Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: pageNumber >= 3
                                              ? const Color(0xff3366FF)
                                              : const Color(0xff9CA3AF)),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            color: pageNumber >= 3
                                                ? const Color(0xff3366FF)
                                                : const Color(
                                                    0xff9CA3AF,
                                                  ),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Upload portfolio",
                              style: TextStyle(
                                color: pageNumber > 2
                                    ? const Color(0xff3366FF)
                                    : Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

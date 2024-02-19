import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Home_Screen/Widget/modle_modle_bottom_sheet.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomChip.dart';
import 'package:jobsque/widget/Search_bar_of_jobs.dart';

class ResaultSearchScreen extends StatefulWidget {
  ResaultSearchScreen({super.key, required this.jobname});

  final String jobname;
  late final TextEditingController _searchController =
      TextEditingController(text: jobname);

  @override
  State<ResaultSearchScreen> createState() => _ResaultSearchScreenState();
}

class _ResaultSearchScreenState extends State<ResaultSearchScreen> {
  List<Widget> jobs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 1),
            child: Consumer(
              builder: (context, ref, _) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 5, right: 15),
                          child: Row(
                            children: [
                              IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: SearchBarForJobs(
                                searchController: widget._searchController,
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const ShowModalBottomSheet();
                                    },
                                  );
                                },
                                child: Icon(Iconsax.setting_4)),
                            const SizedBox(
                              width: 20,
                            ),
                            const Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomChipWithArrow(
                                      icon: Iconsax.arrow_down_14,
                                      text: "Remote  ",
                                      chipColor: Color(0xff091A7A),
                                      textColor: Color(0xffFFFFFF),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CustomChipWithArrow(
                                      icon: Iconsax.arrow_down_14,
                                      text: "Full Time",
                                      chipColor: Color(0xff091A7A),
                                      textColor: Color(0xffFFFFFF),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    CustomChipWithArrow(
                                      icon: Iconsax.arrow_down_14,
                                      text: "Post date",
                                      chipColor: Color(0xffffffff),
                                      textColor: Color(0xff6B7280),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    ref.watch(jobsqueprov).filterJobs.isNotEmpty
                        ? Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 30),
                                height: 36,
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                color: const Color(0XFFE5E7EB),
                                child: Text(
                                  "Featuring ${ref.watch(jobsqueprov).filterJobs.length} jobs",
                                  style:
                                      const TextStyle(color: Color(0XFF6B7280)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: ref.watch(jobsqueprov).filterJobs,
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Image.asset(
                                  "assets/images/icon_images/Search Ilustration.png"),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                "Search not found",
                                // textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  "Try searching with different keywords so we can show you",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xff6B7280),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
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

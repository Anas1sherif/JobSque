import 'package:flutter/material.dart';
import 'package:jobsque/Screens/createAccount_Screens/choose_location_job_screen.dart';

class ChooseJobScreen extends StatefulWidget {
  const ChooseJobScreen({super.key});

  @override
  State<ChooseJobScreen> createState() => _ChooseJobScreenState();
}

class _ChooseJobScreenState extends State<ChooseJobScreen> {
  final controller = PageController();

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
                      softWrap: true,
                      maxLines: 3,
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
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                              // child: Text(categorys),
                              height: 125,
                              width: 156,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(15, 23, 42, 0.12),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  )
                                ],
                                border: Border.all(width: 1),
                                color: Color.fromRGBO(209, 213, 219, 1),
                                borderRadius: BorderRadius.circular(12),
                              )),
                        ),
                        SizedBox(
                          width: 17,
                        ),
                        InkWell(
                          child: Container(
                            // child: Text(categorys),
                            height: 125,
                            width: 156,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(15, 23, 42, 0.12),
                                  blurRadius: 50,
                                  spreadRadius: 0,
                                )
                              ],
                              border: Border.all(width: 1),
                              color: Color.fromRGBO(209, 213, 219, 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                                // child: Text(categorys),
                                height: 125,
                                width: 156,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(15, 23, 42, 0.12),
                                      blurRadius: 50,
                                      spreadRadius: 0,
                                    )
                                  ],
                                  border: Border.all(width: 1),
                                  color: Color.fromRGBO(209, 213, 219, 1),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          InkWell(
                            child: Container(
                              // child: Text(categorys),
                              height: 125,
                              width: 156,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(15, 23, 42, 0.12),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  )
                                ],
                                border: Border.all(width: 1),
                                color: Color.fromRGBO(209, 213, 219, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                                // child: Text(categorys),
                                height: 125,
                                width: 156,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(15, 23, 42, 0.12),
                                      blurRadius: 50,
                                      spreadRadius: 0,
                                    )
                                  ],
                                  border: Border.all(width: 1),
                                  color: Color.fromRGBO(209, 213, 219, 1),
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          InkWell(
                            child: Container(
                              // child: Text(categorys),
                              height: 125,
                              width: 156,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(15, 23, 42, 0.12),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  )
                                ],
                                border: Border.all(width: 1),
                                color: Color.fromRGBO(209, 213, 219, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 150,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseLocationJob(),
                          ),
                        );
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(327, 48),
                          backgroundColor:
                              const Color.fromRGBO(51, 102, 255, 1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

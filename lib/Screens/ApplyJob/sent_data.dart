import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/widget/Bottom_Navigation_Bar.dart';

class SentData extends StatelessWidget {
  const SentData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Apply Job",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            SvgPicture.asset("assets/images/icon_images/Data Ilustration.svg"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Your data has been",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Text(
              "successfully sent",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "You will get a message from our team, about",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(107, 114, 128, 1)),
            ),
            const Text(
              "the announcement of employee acceptance",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(107, 114, 128, 1)),
            ),
            const SizedBox(
              height: 270,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(51, 102, 255, 1),
                    fixedSize: const Size(370, 46)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BootomNavigator(),
                    ),
                  );
                },
                child: const Text(
                  "Back to home",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

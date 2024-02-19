import 'package:flutter/material.dart';
import 'package:jobsque/Screens/Job_Detail/JobDetail.dart';
import 'package:jobsque/model/Jobs_model.dart';
import 'package:jobsque/widget/CustomChip.dart';

class JobsItem extends StatelessWidget {
  JobsItem({
    super.key,
    required this.jobs,
  });
  final Jobs jobs;

  late final List listLocation = jobs.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => JopDetailScreen(jobs: jobs),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    jobs.image,
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
                      jobs.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${jobs.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                CustomChip(
                  text: jobs.jobTimeType,
                ),
                const Spacer(),
                CustomChip(
                  text: jobs.jobType,
                ),
                const Spacer(
                  flex: 10,
                ),
                // const Spacer(
                //   flex: 4
                // ),
                Text(
                  jobs.salary.length > 3
                      ? "\$${(int.parse(jobs.salary) ~/ 1000)}K "
                      : "\$${jobs.salary} ",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2E8E18)),
                ),
                const Text(
                  "/Month",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B7280)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // const Divider(
            //   thickness: 1.5,
            // )
          ],
        ),
      ),
    );
  }
}

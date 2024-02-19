import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/ApplyJob/ApplyJob_screen.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/model/Jobs_model.dart';

class SavedJopsItem extends StatelessWidget {
  SavedJopsItem({super.key, required this.savedjobs});

  final Jobs savedjobs;
  late final List listLocation = savedjobs.location.split(" ");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              height: 200,
              // height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ApplyJopScreen(
                          jobs: savedjobs,
                        ),
                      ));
                    },
                    child: BottomSheetItem(
                      title: "Apply Job",
                      iconsax: Icon(Iconsax.directbox_notif),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO Share Jop
                    },
                    child: BottomSheetItem(
                        title: "Share via...", iconsax: Icon(Iconsax.export)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(builder: (context, ref, _) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        savedjobs.isSaved = false;
                        ref.read(jobsqueprov).unsaveJop(savedjobs);
                      },
                      child: BottomSheetItem(
                          title: "Cancel save",
                          iconsax: Icon(Iconsax.archive_minus)),
                    );
                  }),
                ],
              ),
            );
          },
        );
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
                    savedjobs.image,
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
                      savedjobs.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${savedjobs.compName} • ${listLocation[listLocation.length - 2]} ${listLocation.last} ",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(Iconsax.more)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Posted 2 days ago"),
                const Spacer(),
                Icon(Iconsax.clock),
                const SizedBox(
                  width: 5,
                ),
                const Text("Be an early applicant"),
              ],
            ),
            const SizedBox(
              height: 10,
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
    required this.iconsax,
  });
  final String title;
  final Icon iconsax;
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
            iconsax,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Icon(Iconsax.arrow_right)
          ],
        ),
      ),
    );
  }
}

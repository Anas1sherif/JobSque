import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:path/path.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Consumer(builder: (context, ref, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Add portfolio here",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: ref.watch(jobsqueprov).setPortfolio,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    dashPattern: const [5, 5],
                    color: const Color.fromARGB(255, 20, 76, 230),
                    strokeWidth: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffecf2ff)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SvgPicture.asset(
                            "assets/images/icon_images/document-upload.svg",
                            height: 60,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Upload your other file",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Max. file size 10 MB",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff6B7280),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xffD6E4FF),
                              border:
                                  Border.all(color: const Color(0xff3366FF)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: ,
                              children: [
                                Icon(Iconsax.export),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Add file",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3366FF)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 100,
                  height: 200,
                  child: Column(
                    children: ref.read(jobsqueprov).portofelioList.toList(),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class PortfolioItem extends StatelessWidget {
  const PortfolioItem({super.key, required this.dataOfPdf});
  final PlatformFile? dataOfPdf;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final prov = ref.watch(jobsqueprov);
        return Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffD1D5DB))),
              leading: SvgPicture.asset(
                "assets/images/icon_images/Vector.svg",
                height: 40,
              ),
              title: Text(
                dataOfPdf?.name != null
                    ? basenameWithoutExtension(dataOfPdf!.name)
                    : "  ",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(dataOfPdf?.name != null
                  ? "CV.pdf ${sizeFile(dataOfPdf!.size)} KB"
                  : "    "),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () {
                        ref.watch(jobsqueprov).setCVFile();
                      },
                      child: Icon(Iconsax.edit_2)),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(jobsqueprov).removePortfolio(dataOfPdf!.name);
                    },
                    child: Icon(
                      Iconsax.close_circle,
                      color: Color.fromRGBO(255, 71, 43, 1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }

  sizeFile(int size) {
    final kb = size / 1024;
    final mb = kb / 1024;
    return mb > 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
  }
}

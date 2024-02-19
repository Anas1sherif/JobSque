import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:path/path.dart';

class UploadPortfolioScreen extends StatefulWidget {
  const UploadPortfolioScreen({
    super.key,
  });

  @override
  State<UploadPortfolioScreen> createState() => _UploadPortfolioScreenState();
}

class _UploadPortfolioScreenState extends State<UploadPortfolioScreen> {
  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer(builder: (context, ref, _) {
        final prov = ref.watch(jobsqueprov);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Upload portfolio",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Fill in your bio data correctly",
              style: TextStyle(
                color: Color(0xff6B7280),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  children: [
                    const TextSpan(text: "Upload CV "),
                    const TextSpan(
                        text: "*    ", style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: prov.pdfData == null ? "this Field Required" : "",
                        style: const TextStyle(color: Colors.red))
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xffD1D5DB))),
              leading: SvgPicture.asset(
                "assets/images/icon_images/Vector.svg",
              ),
              title: Text(
                prov.pdfData?.name != null
                    ? basenameWithoutExtension(prov.pdfData!.name)
                    : "  ",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(prov.pdfData?.name != null
                  ? "CV.pdf ${sizeFile(prov.pdfData!.size)} KB"
                  : "    "),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.watch(jobsqueprov).setCVFile();
                    },
                    child: const Icon(
                      Iconsax.edit_2,
                      color: Color.fromRGBO(51, 102, 255, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        ref.read(jobsqueprov).removeCVData();
                      },
                      child: const Icon(
                        Iconsax.close_circle,
                        color: Color.fromRGBO(255, 71, 43, 1),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Other File",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(8),
              dashPattern: const [5, 5],
              color: const Color(0xff6690FF),
              strokeWidth: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffECF2FF)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                        "assets/images/icon_images/document-upload.svg"),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Upload your other file",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                        border: Border.all(color: const Color(0xff3366FF)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: ,
                        children: [
                          Icon(
                            Iconsax.export_1,
                            color: Color.fromRGBO(51, 102, 255, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
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
            const SizedBox(
              height: 50,
            )
          ],
        );
      }),
    );
  }

  sizeFile(int size) {
    final kb = size / 1024;
    final mb = kb / 1024;
    return mb > 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
  }
}

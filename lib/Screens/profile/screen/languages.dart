import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

String selectLang = "English";

List<String> flages = [
  "assets/images/icon_images/England.png",
  "assets/images/icon_images/Indonesia.png",
  "assets/images/icon_images/Saudi Arabia.png",
  "assets/images/icon_images/China.png",
  "assets/images/icon_images/Netherlands.png",
  "assets/images/icon_images/France.png",
  "assets/images/icon_images/Germany.png",
  "assets/images/icon_images/Japan.png",
  "assets/images/icon_images/South Korea.png",
  "assets/images/icon_images/Portugal.png",
];
List<String> nameOfLang = [
  'English',
  'Indonesia',
  'Arabic',
  'Chinese',
  'Dutch',
  'French',
  'German',
  'Japanese',
  'Korean',
  'Portuguese',
];

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Image.asset(
                    flages[index],
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(nameOfLang[index]),
                ],
              ),
              value: nameOfLang[index],
              groupValue: selectLang,
              onChanged: (value) {
                setState(() {
                  selectLang = value!;
                });
              },
            );
          },
          separatorBuilder: (context, index) => const Divider(
                indent: 15,
                endIndent: 20,
                thickness: 1.5,
              ),
          itemCount: flages.length),
    );
  }
}

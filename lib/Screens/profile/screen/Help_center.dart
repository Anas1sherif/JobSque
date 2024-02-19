import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/widget/custom_search.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSearch(
                  hinitText: "What can we help?",
                  searchController: searchController),
              const SizedBox(
                height: 30,
              ),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
              CustomExpansionTile(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomExpansionTile extends StatefulWidget {
  CustomExpansionTile({super.key, this.isExpansion = false});
  bool isExpansion;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD1D5DB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            widget.isExpansion = !widget.isExpansion;
          });
        },
        trailing: Icon(
          widget.isExpansion ? Iconsax.arrow_up_14 : Iconsax.arrow_down_14,
          color: const Color(0xff9CA3AF),
        ),
        iconColor: Colors.black,
        title: const Text(
          "The customer is very happy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(width: 00, color: Color(0xffD1D5DB)),
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "The customer is very important, the customer will be followed by the customer. Fusce ultricies mi enim, quis vulputate nibh faucibus at Maecenas is in front, whether he accepts or not, he flatters flatters. There is a pillow in front and a trigger porta vulputate. He wants to decorate the classroom and not to the ecological boundaries. The phase of the soft quiver before, in the ullamcorper the mass of the ullamcorper and I chat with Leo and let him be a lot of fun sometimes.",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
              strutStyle: StrutStyle(height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.header,
    required this.expanded,
    this.isExpanded = false,
  });
  final String header;
  final String expanded;
  bool isExpanded;
}

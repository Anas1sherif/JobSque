import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/model/Jobs_model.dart';

class SavedIcon extends StatefulWidget {
  const SavedIcon({
    super.key,
    required this.jobs,
  });
  final Jobs jobs;
  @override
  State<SavedIcon> createState() => _SavedIconState();
}

class _SavedIconState extends State<SavedIcon> {
  late bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return GestureDetector(
        onTap: () {
          if (widget.jobs.isSaved) {
            ref.watch(jobsqueprov).unsaveJop(widget.jobs);
          } else {
            ref.watch(jobsqueprov).savedJop(widget.jobs);
          }
          setState(() {});
        },
        child: Icon(
            widget.jobs.isSaved ? Iconsax.archive_minus : Iconsax.archive_minus,
            color:
                widget.jobs.isSaved ? const Color(0xff3366ff) : Colors.black),
      );
    });
  }
}

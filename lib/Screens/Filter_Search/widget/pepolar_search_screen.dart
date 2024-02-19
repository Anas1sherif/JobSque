import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Filter_Search/Result_filtter_Scrren.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';

class PopularSearches extends StatelessWidget {
  const PopularSearches({
    super.key,
    required this.searchName,
  });
  final String searchName;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.watch(jobsqueprov).searchJobs(searchName);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResaultSearchScreen(jobname: searchName),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: double.infinity,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Iconsax.search_status),
                const Spacer(),
                Text(searchName),
                const Spacer(
                  flex: 20,
                ),
                const Icon(
                  Iconsax.arrow_circle_right,
                  color: Color.fromRGBO(51, 102, 255, 1),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

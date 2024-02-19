import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Screens/Filter_Search/Result_filtter_Scrren.dart';

import 'package:jobsque/provider/Jobsque_provider.dart';

// ignore: must_be_immutable
class RecentSearches extends StatelessWidget {
  RecentSearches({
    super.key,
    required this.searchName,
  });

  String searchName;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: () {
          ref.watch(jobsqueprov).searchJobs(searchName);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResaultSearchScreen(jobname: searchName),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: double.infinity,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Iconsax.clock),
                const Spacer(),
                Text(
                  searchName,
                ),
                const Spacer(
                  flex: 20,
                ),
                GestureDetector(
                  onTap: () {
                    ref.watch(jobsqueprov).deleteSearch(searchName);
                  },
                  child: Icon(
                    Iconsax.close_circle,
                    color: Color.fromRGBO(255, 71, 43, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

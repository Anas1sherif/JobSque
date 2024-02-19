import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/Database/Local_Database.dart';
import 'package:jobsque/Screens/Filter_Search/Result_filtter_Scrren.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';

class SearchBarForJobs extends StatefulWidget {
  const SearchBarForJobs({
    super.key,
    required this.searchController,
    this.isinSearchScreen = false,
  });
  final TextEditingController searchController;
  final bool isinSearchScreen;

  @override
  State<SearchBarForJobs> createState() => _SearchBarForJobsState();
}

class _SearchBarForJobsState extends State<SearchBarForJobs> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Consumer(
        builder: (context, ref, _) {
          return TextField(
            // textAlign: TextAlign.,
            autofocus: widget.isinSearchScreen ? true : false,

            controller: widget.searchController,
            onSubmitted: (value) async {
              LocalDataBase.getRecentSearche(ref.watch(jobsqueprov).user!,
                  ref.watch(jobsqueprov).setSearch(value.trim()));
              if (value.isEmpty) {
                return;
              }
              setState(
                () {
                  widget.searchController.text = value;
                },
              );
              ref.read(jobsqueprov).getSearch(widget.searchController.text);
              await Future.delayed(
                const Duration(milliseconds: 400),
              );
              if (widget.isinSearchScreen) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResaultSearchScreen(jobname: value),
                  ),
                );
              }
            },

            // selectionHeightStyle: BoxHeightStyle.tight,
            cursorColor: const Color.fromARGB(121, 139, 136, 136),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              prefixIconColor: Colors.black,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffD1D5DB),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffD1D5DB),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              // prefixIcon: const Icon(Icons.search_sharp)
              prefixIcon: Icon(Iconsax.search_normal_1),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(
                    () {
                      widget.searchController.clear();
                    },
                  );
                },
                icon: Icon(Iconsax.close_circle),
              ),
            ),
          );
        },
      ),
    );
  }
}

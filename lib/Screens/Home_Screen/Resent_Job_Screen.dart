import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';

class RecentJopScreen extends StatelessWidget {
  const RecentJopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Job"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
        child: Consumer(builder: (context, ref, _) {
          return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  ref.watch(jobsqueprov).home[index],
              separatorBuilder: (context, index) => const Divider(
                    thickness: 1.5,
                  ),
              itemCount: ref.watch(jobsqueprov).home.length);
        }),
      ),
    );
  }
}

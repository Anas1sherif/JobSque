import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/provider/Jobsque_provider.dart';
import 'package:jobsque/widget/CustomElvatued_Button.dart';
import 'package:jobsque/widget/Custom_text_failed.dart';

class EmailAdressScreen extends ConsumerWidget {
  EmailAdressScreen({
    super.key,
    // required this.email,
  });
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _emailController.text = ref.watch(jobsqueprov).user!.email!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email address"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Main e-mail address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                prefixIcons: Icon(Iconsax.sms), controller: _emailController),
            const Spacer(),
            CustomElvatedButton(
              onpress: () {
                // myVariableProvider.dependencies;
                ref.read(jobsqueprov).user!.email = _emailController.text;
                ref.read(jobsqueprov).editUser();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("changed successfully")));
                Navigator.of(context).pop();

                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const BootomNavigator(),
                // ));
              },
              text: const Text("Save"),
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

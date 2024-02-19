import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    this.icon,
    this.withicon = false,
    required this.ontap,
  });
  final bool withicon;
  final String title;
  final IconData? icon;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          leading: withicon
              ? CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xffD6E4FF),
                  child: Icon(
                    icon,
                    color: const Color(0xff3d6eff),
                  ),
                )
              : null,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Iconsax.arrow_right_14),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          thickness: 1,
        ),
      ],
    );
  }
}

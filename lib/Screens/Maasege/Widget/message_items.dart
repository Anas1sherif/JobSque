import 'package:flutter/material.dart';
import 'package:jobsque/Screens/Maasege/Chat_Screen.dart';
import 'package:jobsque/model/company_model.dart';

class MessageItems extends StatelessWidget {
  const MessageItems({
    super.key,
    required this.company,
  });
  final Company company;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatScreen(company: company),
        ));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: ClipOval(
          child: Image.asset(
            company.image!,
            fit: BoxFit.cover,
            width: 45,
          ),
        ),
        title: Text(company.name!),
        subtitle: const Text(
          "Here is the link: http://zoom.com/abcdeefg",
          maxLines: 1,
          style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
        ),
        trailing: const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            "12.39",
            style: TextStyle(fontSize: 12, color: Color(0xff3366FF)),
          ),
        ),
      ),
    );
  }
}

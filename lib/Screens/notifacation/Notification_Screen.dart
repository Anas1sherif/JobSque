import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 410,
                height: 36,
                color: const Color.fromRGBO(244, 244, 245, 1),
                child: Padding(
                  padding: new EdgeInsets.only(left: 10),
                  child: const Text(
                    "New",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const ItemNotificationNew(
              image: "assets/images/icon_images/Dana Logo.png",
              title: "Dana ",
              subtitle: "Posted new design jobs"),
          const Divider(
            indent: 12,
            endIndent: 12,
            color: Color.fromRGBO(229, 231, 235, 1),
          ),
          const ItemNotificationNew(
              image: "assets/images/icon_images/Shoope Logo.png",
              title: "Shoope ",
              subtitle: "Posted new design jobs"),
          const Divider(
            indent: 12,
            endIndent: 12,
            color: Color.fromRGBO(229, 231, 235, 1),
          ),
          const ItemNotificationNew(
              image: "assets/images/icon_images/Slack Logo.png",
              title: "Slack ",
              subtitle: "Posted new design jobs"),
          const Divider(
            indent: 12,
            endIndent: 12,
            color: Color.fromRGBO(229, 231, 235, 1),
          ),
          const ItemNotificationNew(
              image: "assets/images/icon_images/Facebook Logo.png",
              title: "Facebook ",
              subtitle: "Posted new design jobs"),
          const Divider(
            indent: 12,
            endIndent: 12,
            color: Color.fromRGBO(229, 231, 235, 1),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 410,
                height: 36,
                color: const Color.fromRGBO(244, 244, 245, 1),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Yesterday",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const ItemNotificationYesterday(
              pngimage: "assets/images/icon_images/Email.svg",
              title: "Email setup successful",
              subtitle:
                  "Your email setup was successful with the following details: Your new email is rafifdianganz@gmail.com."),
          const Divider(
            indent: 12,
            endIndent: 12,
            color: Color.fromRGBO(229, 231, 235, 1),
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/images/icon_images/Jobsque Logo.svg",
              fit: BoxFit.cover,
            ),
            title: const Text(
              "Welcome to Jobsque",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(17, 24, 39, 1)),
            ),
            subtitle: const Text(
              "Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(75, 85, 99, 1)),
            ),
            trailing: const Text(
              "10.00AM",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(107, 114, 128, 1)),
            ),
          ),
          const Divider(
            indent: 12,
            endIndent: 12,
            color: Color.fromRGBO(229, 231, 235, 1),
          ),
        ],
      ),
    );
  }
}

class ItemNotificationNew extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;

  const ItemNotificationNew(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  State<ItemNotificationNew> createState() => _ItemNotificationNewState();
}

class _ItemNotificationNewState extends State<ItemNotificationNew> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      ListTile(
        leading: Image.asset(widget.image),
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        subtitle: Text(
          widget.subtitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(107, 114, 128, 1),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: const Color.fromRGBO(219, 180, 14, 1)),
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              "10.00AM",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(107, 114, 128, 1)),
            ),
          ],
        ),
      ),
    ]);
  }
}

class ItemNotificationYesterday extends StatefulWidget {
  final String pngimage;
  final String title;
  final String subtitle;
  const ItemNotificationYesterday(
      {super.key,
      required this.pngimage,
      required this.title,
      required this.subtitle});

  @override
  State<ItemNotificationYesterday> createState() =>
      _ItemNotificationYesterdayState();
}

class _ItemNotificationYesterdayState extends State<ItemNotificationYesterday> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: SvgPicture.asset(widget.pngimage),
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(17, 24, 39, 1)),
          ),
          subtitle: Text(
            widget.subtitle,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(75, 85, 99, 1)),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 8,
                  width: 8,
                  color: const Color.fromRGBO(219, 180, 14, 1)),
              const SizedBox(
                width: 3,
              ),
              const Text(
                "10.00AM",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(107, 114, 128, 1)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

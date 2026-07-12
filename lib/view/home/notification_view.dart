import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/notification_row.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {
      "img": "assets/img/launch.png",
      "title": "Your order has been shipped",
      "time": "2 hours ago",
    },
    {
      "img": "assets/img/notifications1.png",
      "title": "Your order has been delivered",
      "time": "1 day ago",
    },
    {
      "img": "assets/img/lunch.png",
      "title": "Your order has been cancelled",
      "time": "3 days ago",
    },
    {
      "img": "assets/img/notifications2.png",
      "title": "Your order has been cancelled",
      "time": "3 days ago",
    },
    {
      "img": "assets/img/notifications.png",
      "title": "Your order has been cancelled",
      "time": "3 days ago",
    },
    {
      "img": "assets/img/notifications3.png",
      "title": "Your order has been cancelled",
      "time": "3 days ago",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/back_nav.png",
              width: 10,
              height: 10,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              //Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TColor.LightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/img/more_nav.png",
                width: 13,
                height: 13,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        itemBuilder: ((context, index) {
          var nobj = notificationArr[index] as Map? ?? {};
          return NotificationRow(obj: nobj);
        }),
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: TColor.gray.withOpacity(0.2));
        },
        itemCount: notificationArr.length,
      ),
    );
  }
}

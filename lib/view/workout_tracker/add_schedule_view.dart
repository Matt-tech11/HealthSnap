import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common/common.dart';
import 'package:healthsnap/common_widget/icon_title_next_row.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/view/workout_tracker/workout_schedule_view.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;
  const AddScheduleView({super.key, required this.date});

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.LightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/close.png",
              color: Colors.black,
              width: 15,
              height: 15,
            ),
          ),
        ),
        title: Text(
          "Add Schedule",
          style: TextStyle(
            color: TColor.black,
            fontSize: 19,
            fontWeight: FontWeight.w700,
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
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/img/calendar.png", width: 20, height: 20),
                const SizedBox(width: 8),
                Text(
                  dateToString(widget.date, formatStr: "E, dd MMM yyyy"),
                  style: TextStyle(color: TColor.gray, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Time",
              style: TextStyle(
                color: TColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: media.width * 0.5,
              child: CupertinoDatePicker(
                onDateTimeChanged: (newDate) {},
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Details Workout",
              style: TextStyle(
                color: TColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/barbel_1.png",
              title: "Choose Workout",
              time: "Upperbody",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/icon_swap.png",
              title: "Difficulty",
              time: "Beginner",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/icon_repetitions.png",
              title: "Custom Repitition",
              time: "",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/icon_repetitions.png",
              title: "Custom Weights",
              time: "",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            Spacer(),
            RoundButton(title: "Save", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

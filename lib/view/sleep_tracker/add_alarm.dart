import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/icon_title_next_row.dart';
import 'package:healthsnap/common_widget/round_button.dart';
//import 'package:healthsnap/view/workout_tracker/workout_schedule_view.dart';

class AddAlarmView extends StatefulWidget {
  final DateTime date;
  const AddAlarmView({super.key, required this.date});

  @override
  State<AddAlarmView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddAlarmView> {
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
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
              width: 13,
              height: 13,
            ),
          ),
        ),
        title: Text(
          "Add Alarm",
          style: TextStyle(
            color: TColor.black,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          // InkWell(
          //   onTap: () {
          //     //Navigator.pop(context);
          //   },
          //   child: Container(
          //     margin: const EdgeInsets.all(8),
          //     height: 40,
          //     width: 40,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       color: TColor.LightGray,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Image.asset(
          //       "assets/img/more_nav.png",
          //       width: 13,
          //       height: 13,
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/bedtime.png",
              title: "Bedtime",
              time: "9:00Am",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/time_circle.png",
              title: "Hours of sleep",
              time: "8hours 30minutes",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            IconTitleNextRow(
              icon: "assets/img/repeat.png",
              title: "Repeat",
              time: "Mon to Fri",
              color: TColor.LightGray,
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            // IconTitleNextRow(
            //   icon: "assets/img/vibrate.png",
            //   title: "vibrate When Alarm Sound",
            //   time: "",
            //   color: TColor.LightGray,
            //   onPressed: () {},
            // ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: TColor.LightGray,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 15),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/vibrate.png",
                      width: 18,
                      height: 18,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Vibrate When Alarm Sound",
                      style: TextStyle(color: TColor.gray, fontSize: 12),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                    child: Transform.scale(
                      scale: 0.7,
                      child: CustomAnimatedToggleSwitch<bool>(
                        current: positive,
                        values: [false, true],
                        spacing: 0.0,
                        indicatorSize: const Size.square(30.0),
                        animationDuration: const Duration(milliseconds: 200),
                        animationCurve: Curves.linear,
                        onChanged: (b) {
                          setState(() => positive = b);
                        },
                        iconBuilder: (context, local, global) {
                          return const SizedBox();
                        },
                        cursors: ToggleCursors(
                          defaultCursor: SystemMouseCursors.click,
                        ),
                        onTap: (info) {
                          setState(() => positive = !positive);
                        },
                        iconsTappable: false,
                        wrapperBuilder: (context, global, child) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 10.0,
                                right: 10.0,
                                height: 30.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: TColor.secondaryG,
                                    ),

                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                              child,
                            ],
                          );
                        },
                        foregroundIndicatorBuilder: (context, global) {
                          return SizedBox.fromSize(
                            size: const Size(10, 10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,

                                    blurRadius: 1.1,
                                    offset: Offset(0, 0.8),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            RoundButton(title: "Add", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

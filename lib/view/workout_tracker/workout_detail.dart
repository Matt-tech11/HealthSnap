import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/upcoming_workout_row.dart';
import 'package:healthsnap/common_widget/what_train.dart';

class WorkoutDetail extends StatefulWidget {
  final Map dObj;
  const WorkoutDetail({super.key, required this.dObj});

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  List latestArr = [
    {
      "img": "assets/img/skip.png",
      "title": "Fullbody Workout",
      "time": "Today, 03:00pm",
    },
    {
      "img": "assets/img/lift.png",
      "title": "Upperbody Workout",
      "time": "June 05, 02:00pm",
    },
  ];
  List upcomingArr = [
    {
      "img": "assets/img/skipper.png",
      "title": "Fullbody Workout",
      "exercises": "11 Exercises",
      "time": "32mins",
    },
    {
      "img": "assets/img/lowerbody.png",
      "title": "Lowerbody Workout",
      "exercises": "12 Exercises",
      "time": "40mins",
    },
    {
      "img": "assets/img/ab_workout.png",
      "title": "AB Workout",
      "exercises": "14 Exercises",
      "time": "20mins",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: TColor.primaryG),
      ),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              //leadingWidth: 0,
              //automaticallyImplyLeading: false,
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
                    "assets/img/back_nav.png",
                    color: Colors.black,
                    width: 15,
                    height: 15,
                  ),
                ),
              ),

              //pinned: true,
              actions: [
                InkWell(
                  onTap: () {},
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: media.width * 0.5,
                width: double.maxFinite,
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: TColor.gray.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),

                  // DAILY WORKOUT SCHEDULE SECTION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dObj["title"].toString(),
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "${widget.dObj["exercise"].toString()}exrcises | ${widget.dObj["time"].toString()} 320 Calories Burn",
                              style: TextStyle(
                                color: TColor.gray,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          "assets/img/fav.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.05),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: TColor.primaryColor2.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Workout Schedule",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/img/arrow_right.png",
                                width: 12,
                                height: 12,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: media.width * 0.05),

                  //ListView.builder(
                  // padding: EdgeInsets.zero,
                  // physics: NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  //itemCount: latestArr.length,
                  //itemBuilder: (context, index) {
                  //var wObj = latestArr[index] as Map? ?? {};
                  //return UpcomingWorkoutRow(wObj: wObj);
                  //},
                  //),

                  //SizedBox(height: media.width * 0.05),
                  //Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //children: [
                  //Text(
                  //"What Do You Want to Train",
                  //style: TextStyle(
                  //color: TColor.black,
                  //fontSize: 16,
                  //fontWeight: FontWeight.w700,
                  //),
                  //),
                  //],
                  //),
                  ///SizedBox(height: media.width * 0.03),
                  //ListView.builder(
                  //padding: EdgeInsets.zero,
                  //physics: NeverScrollableScrollPhysics(),
                  //shrinkWrap: true,
                  //itemCount: upcomingArr.length,
                  //itemBuilder: (context, index) {
                  //var wObj = upcomingArr[index] as Map? ?? {};
                  // return WhatTrain(wObj: wObj);
                  //},
                  //),
                  SizedBox(height: media.width * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

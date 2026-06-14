import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/exercise_set_section.dart';
import 'package:healthsnap/common_widget/icon_title_next_row.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/upcoming_workout_row.dart';

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

  List youArr = [
    {"img": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
    {"img": "assets/img/barbel.png", "title": "Barbel"},
    {"img": "assets/img/water_bottle.png", "title": "Bottle 1 Liters"},
  ];

  List exerciseArr = [
    {
      "name": "Set 1",
      "set": [
        {"img": "assets/img/warm_up.png", "title": "Warm Up", "value": "05:00"},
        {
          "img": "assets/img/jumping_jack.png",
          "title": "Jumping Jack",
          "value": "05:00",
        },
        {"img": "assets/img/skipp.png", "title": "Skipping", "value": "05:00"},
        {"img": "assets/img/squats.png", "title": "Squats", "value": "05:00"},
        {
          "img": "assets/img/arm_raises.png",
          "title": "Arm Raises",
          "value": "05:00",
        },
        {
          "img": "assets/img/rest.png",
          "title": "Rest and Drink",
          "value": "05:00",
        },
      ],
    },
    {
      "name": "Set 2",
      "set": [
        {
          "img": "assets/img/rest.png",
          "title": "Rest and Drink",
          "value": "05:00",
        },
      ],
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
                    fit: BoxFit.contain,
                  ),
                ),
              ),
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
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/skip_detail.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: //Stack(
                //children: [
                SingleChildScrollView(
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
                                  "${widget.dObj["exercise"].toString()} | ${widget.dObj["time"].toString()} 320 Calories Burn",
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

                      IconTitleNextRow(
                        icon: "assets/img/calendar.png",
                        title: "Schedule Workout",
                        time: "5/27, 09:00 AM",
                        color: TColor.primaryColor2.withOpacity(0.3),
                        onPressed: () {},
                      ),

                      SizedBox(height: media.width * 0.05),

                      IconTitleNextRow(
                        icon: "assets/img/difficulity.png",
                        title: "Difficulty",
                        time: "Beginner",
                        color: TColor.secondaryColor2.withOpacity(0.3),
                        onPressed: () {},
                      ),

                      SizedBox(height: media.width * 0.05),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll need",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${youArr.length} Items",
                              style: TextStyle(
                                color: TColor.gray,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: youArr.length,
                          itemBuilder: (context, index) {
                            var yObj = youArr[index] as Map? ?? {};

                            return Container(
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: media.width * 0.35,
                                    width: media.width * 0.35,
                                    decoration: BoxDecoration(
                                      color: TColor.LightGray,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      yObj["img"].toString(),
                                      width: media.width * 0.2,
                                      height: media.width * 0.2,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      yObj["title"].toString(),
                                      style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: media.width * 0.05),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${exerciseArr.length} Sets",
                              style: TextStyle(
                                color: TColor.gray,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: exerciseArr.length,
                        itemBuilder: (context, index) {
                          var sObj = exerciseArr[index] as Map? ?? {};

                          return ExerciseSetSection(
                            sObj: sObj,
                            onPressed: (obj) {},
                          );
                        },
                      ),

                      SizedBox(height: media.width * 0.25),
                    ],
                  ),
                ),

            //SafeArea(
            //child: Column(
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.end,
            //children: [
            //RoundButton(title: "Start Workout", onPressed: () {}),
            //],
            //),
            //),

            //],
            //),
          ),
        ),
      ),
    );
  }
}

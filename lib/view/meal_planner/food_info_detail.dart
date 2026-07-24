import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/exercise_set_section.dart';
import 'package:healthsnap/common_widget/icon_title_next_row.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/view/workout_tracker/exercises_step_details.dart';
import 'package:healthsnap/view/workout_tracker/workout_schedule_view.dart';

class FoodInfoDetail extends StatefulWidget {
  final Map mObj;
  final Map dObj;
  const FoodInfoDetail({super.key, required this.dObj, required this.mObj});

  @override
  State<FoodInfoDetail> createState() => _FoodInfoDetailState();
}

class _FoodInfoDetailState extends State<FoodInfoDetail> {
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

  List nutritionArr = [
    {"img": "assets/img/calories_icon.png", "title": "180kCal"},
    {"img": "assets/img/fat_icon.png", "title": "9g Fat"},
    {"img": "assets/img/protein_icon.png", "title": "20g Protein"},
    {"img": "assets/img/carbo_icon.png", "title": "30g Carbs"},
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
          "img": "assets/img/inclined_pushup.png",
          "title": "Inclined Push-Ups",
          "value": "05:00",
        },
        {
          "img": "assets/img/push_up.png",
          "title": "Push-Ups",
          "value": "05:00",
        },
        {"img": "assets/img/skipp.png", "title": "Skipping", "value": "05:00"},
        {
          "img": "assets/img/cobra_stretch.png",
          "title": "Cobra Stretch",
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
      "name": "Set 3",
      "set": [
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
                    "assets/img/back_navs.png",
                    color: Colors.black,
                    width: 13,
                    height: 13,
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
                      width: 13,
                      height: 13,
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
              flexibleSpace: ClipRect(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.scale(
                      scale: 1.25,
                      child: Container(
                        width: media.width * 0.55,
                        height: media.width * 0.55,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(
                            media.width * 0.275,
                          ),
                        ),
                      ),
                    ),

                    Transform.scale(
                      scale: 1.2,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          widget.dObj["b_image"].toString(),
                          width: media.width * 0.50,
                          height: media.width * 0.50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
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
            body: Stack(
              children: [
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
                                  widget.dObj["name"].toString(),
                                  style: TextStyle(
                                    color: TColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "by Jacques Pépin",
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nutrition",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: nutritionArr.length,
                          itemBuilder: (context, index) {
                            var nObj = nutritionArr[index] as Map? ?? {};

                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    TColor.primaryColor2.withOpacity(0.4),
                                    TColor.primaryColor1.withOpacity(0.4),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    nObj["img"].toString(),
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      nObj["title"].toString(),
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

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       "Exercises",
                      //       style: TextStyle(
                      //         color: TColor.black,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w700,
                      //       ),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         "${exerciseArr.length} Sets",
                      //         style: TextStyle(
                      //           color: TColor.gray,
                      //           fontSize: 12,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: exerciseArr.length,
                        itemBuilder: (context, index) {
                          var sObj = exerciseArr[index] as Map? ?? {};

                          return ExerciseSetSection(
                            sObj: sObj,
                            onPressed: (obj) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ExercisesStepDetails(eObj: obj),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      SizedBox(height: media.width * 0.25),
                    ],
                  ),
                ),

                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundButton(
                        title: "Add to ${widget.mObj['name']} Meal",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

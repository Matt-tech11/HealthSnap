import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/exercise_set_section.dart';
import 'package:healthsnap/common_widget/food_step_detail_row.dart';
import 'package:healthsnap/common_widget/icon_title_next_row.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/view/workout_tracker/exercises_step_details.dart';
import 'package:healthsnap/view/workout_tracker/workout_schedule_view.dart';
import 'package:readmore/readmore.dart';

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
    {"img": "assets/img/protein_1.png", "title": "20g Protein"},
    {"img": "assets/img/carbo_icon.png", "title": "30g Carbs"},
  ];

  List stepArr = [
    {
      "no": "01",
      "title": "Mix dry ingredients",
      "details": "Combine flour, sugar, baking powder, and salt in a bowl.",
    },
    {
      "no": "02",
      "title": "Mix wet ingredients",
      "details": "Whisk milk, egg, and melted butter in a separate container.",
    },
    {
      "no": "03",
      "title": "Combine ingredients",
      "details":
          "Pour the wet mixture into the dry mix and stir gently until just combined.",
    },
    {
      "no": "04",
      "title": "Heat the pan",
      "details":
          " Warm a lightly oiled or buttered frying pan over medium heat.",
    },
    {
      "no": "05",
      "title": "Cook and flip",
      "details":
          "Cook until golden brown on one side, then flip and cook the other side.Pour a small amount of batter into the pan, cook until bubbles appear on top, then flip and brown the other side.",
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
                  margin: const EdgeInsets.all(12),
                  height: 60,
                  width: 60,
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
              // actions: [
              //   InkWell(
              //     onTap: () {},
              //     child: Container(
              //       margin: const EdgeInsets.all(8),
              //       height: 40,
              //       width: 40,
              //       alignment: Alignment.center,
              //       decoration: BoxDecoration(
              //         color: TColor.LightGray,
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Image.asset(
              //         "assets/img/more_nav.png",
              //         width: 13,
              //         height: 13,
              //         fit: BoxFit.contain,
              //       ),
              //     ),
              //   ),
              // ],
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
                        width: media.width * 0.5,
                        height: media.width * 0.5,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 4,
                            decoration: BoxDecoration(
                              color: TColor.gray.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ],
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

                      Text(
                        "Nutrition",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
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
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 4,
                              ),
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

                      Text(
                        "Description",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: media.width * 0.1),
                      const SizedBox(height: 4),
                      ReadMoreText(
                        'Pancakes are some people\'s favorite breakfast—who doesn\'t love pancakes? Especially when they\'re topped with a generous drizzle of real honey. Soft, fluffy, and delicious, pancakes are a comforting meal that can brighten anyone\'s morning. Besides being incredibly tasty, they are also versatile and easy to customize with fruits, syrup, butter, chocolate chips, nuts, or whipped cream. Whether enjoyed as a quick breakfast, a weekend brunch, or even a sweet treat later in the day, pancakes remain a timeless favorite for people of all ages.',
                        trimMode: TrimMode.Line,
                        trimLines: 4,
                        colorClickableText: TColor.black,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: '...Read Less',
                        moreStyle: TextStyle(
                          color: TColor.gray,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Step by Step",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${stepArr.length} Steps",
                              style: TextStyle(
                                color: TColor.gray,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: stepArr.length,
                        itemBuilder: (context, index) {
                          var sObj = stepArr[index] as Map? ?? {};
                          return FoodStepDetailRow(
                            sObj: sObj,
                            isLast: stepArr.last == sObj,
                          );
                        },
                      ),
                      SizedBox(height: media.width * 0.1),
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

//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/find_eat_cell.dart';
import 'package:healthsnap/common_widget/meal_catergory_cell.dart';
//import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/today_meal_row.dart';

class MealFoodDetail extends StatefulWidget {
  final Map eObj;
  const MealFoodDetail({super.key, required this.eObj});

  @override
  State<MealFoodDetail> createState() => _MealFoodDetailState();
}

class _MealFoodDetailState extends State<MealFoodDetail> {
  List categoryArr = [
    {"name": "Salad", "image": "assets/img/food_4.png"},
    {"name": "Cake", "image": "assets/img/food_5.png"},
    {"name": "Pie", "image": "assets/img/food_7.png"},
    {"name": "Smoothies", "image": "assets/img/food_6.png"},
    {"name": "Salad", "image": "assets/img/food_4.png"},
    {"name": "Cake", "image": "assets/img/food_5.png"},
    {"name": "Pie", "image": "assets/img/food_7.png"},
    {"name": "Smoothies", "image": "assets/img/food_6.png"},
  ];

  List popularArr = [
    {
      "name": "Pancakes",
      "image": "assets/img/food_1.png",
      "size": "Medium",
      "time": "30mins",
      "kCal": "230kCal",
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/food_7.png",
      "size": "Medium",
      "time": "20mins",
      "kCal": "130kCal",
    },
  ];
  List recommendArr = [
    {
      "name": "Pancakes",
      "image": "assets/img/food_1.png",
      "size": "Easy",
      "time": "30mins",
      "kCal": "180kCal",
    },
    {
      "name": "Canai Bread",
      "image": "assets/img/food_7.png",
      "size": "Easy",
      "time": "20mins",
      "kCal": "230kCal",
    },
  ];

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
              width: 13,
              height: 13,
            ),
          ),
        ),
        title: Text(
          widget.eObj["name"].toString(),
          style: TextStyle(
            color: TColor.black,
            fontSize: 19,
            fontWeight: FontWeight.w700,
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
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: media.width * 0.05),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryArr.length,
                    itemBuilder: (context, index) {
                      var cObj = categoryArr[index] as Map? ?? {};
                      return MealCatergoryCell(cObj: cObj, index: index);
                    },
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: ListView.builder(
                //     padding: EdgeInsets.zero,
                //     itemCount: popularArr.length,
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       var mObj = popularArr[index] as Map? ?? {};
                //       return TodayMealRow(mObj: mObj);
                //     },
                //   ),
                // ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommendation\nfor Diet",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(
                    height: media.width * 0.55,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendArr.length,
                      itemBuilder: (context, index) {
                        var fObj = recommendArr[index] as Map? ?? {};
                        return FindEatCell(fObj: fObj, index: index);
                      },
                    ),
                  ),
                  SizedBox(height: media.width * 0.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

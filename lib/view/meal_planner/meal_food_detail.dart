//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/find_eat_cell.dart';
//import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/today_meal_row.dart';

class MealFoodDetail extends StatefulWidget {
  final Map eObj;
  const MealFoodDetail({super.key, required this.eObj});

  @override
  State<MealFoodDetail> createState() => _MealFoodDetailState();
}

class _MealFoodDetailState extends State<MealFoodDetail> {
  List todayMealArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/food_1.png",
      "time": "28/08/2026 08:00 AM",
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/food_7.png",
      "time": "28/08/2026 09:30 AM",
    },
  ];

  List findEatArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/food_2.png",
      "number": "120+ Foods",
    },
    {"name": "Lunch", "image": "assets/img/food_3.png", "number": "300+ Foods"},
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
      body: Column(
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
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: findEatArr.length,
                  itemBuilder: (context, index) {
                    var cObj = findEatArr[index] as Map? ?? {};
                    return MealFoodDetail(cObj: fObj, index: index);
                  },
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: todayMealArr.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var mObj = todayMealArr[index] as Map? ?? {};
                    return TodayMealRow(mObj: mObj);
                  },
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Find Something to Eat",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // SizedBox(
                //   height: media.width * 0.55,
                //   child: ListView.builder(
                //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //     scrollDirection: Axis.horizontal,
                //     itemCount: findEatArr.length,
                //     itemBuilder: (context, index) {
                //       var fObj = findEatArr[index] as Map? ?? {};
                //       return FindEatCell(fObj: fObj, index: index);
                //     },
                //   ),
                // ),
                SizedBox(height: media.width * 0.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

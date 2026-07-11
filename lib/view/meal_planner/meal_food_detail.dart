import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/find_eat_cell.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/today_meal_row.dart';

class MealFoodDetail extends StatefulWidget {
  const MealFoodDetail({super.key});

  @override
  State<MealFoodDetail> createState() => _MealFoodDetailState();
}

class _MealFoodDetailState extends State<MealFoodDetail> {
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
          "Meal Planner",
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
                width: 15,
                height: 15,
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Workout Progress",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        items: ["Weekly", "Monthly"]
                            .map(
                              (name) => DropdownMenuItem(
                                value: name,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    color: TColor.gray,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                        icon: Icon(Icons.arrow_drop_down, color: TColor.white),
                        hint: Text(
                          "Weekly",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: TColor.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.1),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: media.width * 0.5,
                  width: double.maxFinite,
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchCallback:
                            (
                              FlTouchEvent event,
                              LineTouchResponse? response,
                            ) {},
                        mouseCursorResolver:
                            (FlTouchEvent event, LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(color: Colors.transparent),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                              radius: 3,
                                              color: TColor.white,
                                              strokeWidth: 3,
                                              strokeColor:
                                                  TColor.secondaryColor1,
                                            ),
                                  ),
                                );
                              }).toList();
                            },
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (spot) => TColor.secondaryColor1,
                          tooltipRoundedRadius: 20,
                          getTooltipItems: (List<LineBarSpot> linearBarsSpot) {
                            return linearBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                "${lineBarSpot.x.toInt()} mins ago",
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      lineBarsData: lineBarsData1,
                      minY: -0.5,
                      maxY: 110,
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                        bottomTitles: AxisTitles(sideTitles: bottomTitles()),
                        rightTitles: AxisTitles(sideTitles: rightTitles()),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 25,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: TColor.gray.withOpacity(0.15),
                            strokeWidth: 2,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                  ),
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
                        "Daily Meal Schedule",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        height: 30,
                        child: RoundButton(
                          title: "Check",
                          type: RoundButtonType.bgGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const ActivityTrackerView(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Meals",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButton(
                        items:
                            [
                                  "Breakfast",
                                  "Lunch",
                                  "Supper",
                                  "Desserts",
                                  "Snacks",
                                ]
                                .map(
                                  (name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                        color: TColor.gray,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {},
                        icon: Icon(Icons.arrow_drop_down, color: TColor.white),
                        hint: Text(
                          "Breakfast",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: TColor.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: todayMealArr.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var mObj = todayMealArr[index] as Map? ?? {};
                    return TodayMealRow(mObj: mObj);
                  },
                ),
              ],
            ),
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

                SizedBox(
                  height: media.width * 0.55,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: findEatArr.length,
                    itemBuilder: (context, index) {
                      var fObj = findEatArr[index] as Map? ?? {};
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
    );
  }
}

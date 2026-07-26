import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/meal_food_schedule_row.dart';
import 'package:healthsnap/common_widget/nutrition_row.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class MealScheduleView extends StatefulWidget {
  const MealScheduleView({super.key});

  @override
  State<MealScheduleView> createState() => _MealScheduleViewState();
}

class _MealScheduleViewState extends State<MealScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  List breakfastArr = [
    {
      "name": "Pancakes",
      "time": "7:00am",
      "image": "assets/img/pancakes_3.png",
    },
    {"name": "Coffee", "time": "7:30am", "image": "assets/img/coffee.png"},
  ];

  List lunchArr = [
    {
      "name": "Chicken Steak",
      "time": "1:00pm",
      "image": "assets/img/chicken_steak.png",
    },
    {
      "name": "Milk",
      "time": "1:20pm",
      "image": "assets/img/glass_of_milk_1.png",
    },
  ];

  List snacksArr = [
    {
      "name": "Orange",
      "time": "4:30pm",
      "image": "assets/img/orange_snacks.png",
    },
    {"name": "Pie", "time": "4:40pm", "image": "assets/img/apple_pie.png"},
  ];
  List dinnerArr = [
    {"name": "Salad", "time": "7:10pm", "image": "assets/img/salad.png"},
    {"name": "OatMeal", "time": "8:10pm", "image": "assets/img/oatmeal.png"},
  ];
  List NutritionArr = [
    {
      "title": "Calories",
      "image": "assets/img/burn.png",
      "unit_name": "kcal",
      "value": "350",
      "max_value": "500",
    },
    {
      "title": "Carbo",
      "image": "assets/img/carbo_icon.png",
      "unit_name": "g",
      "value": "300",
      "max_value": "1000",
    },
    {
      "title": "Proteins",
      "image": "assets/img/proteins.png",
      "unit_name": "g",
      "value": "140",
      "max_value": "1000",
    },
    {
      "title": "Fats",
      "image": "assets/img/fat_icon.png",
      "unit_name": "g",
      "value": "10",
      "max_value": "20",
    },
  ];
  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

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

              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Meal Schedule",
          style: TextStyle(
            color: TColor.black,
            fontSize: 19,
            fontWeight: FontWeight.w700,
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
      backgroundColor: TColor.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/arrow_left.png",
                width: 15,
                height: 15,
              ),
            ),
            training: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/arrow_right2.png",
                width: 15,
                height: 15,
              ),
            ),
            weekDay: WeekDay.short,
            dayNameFontSize: 12,
            dayNumberFontSize: 16,
            dayBGColor: Colors.grey.withOpacity(0.15),
            titleSpaceBetween: 15,
            backgroundColor: Colors.transparent,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: "en",
            initialDate: DateTime.now(),
            calendarEventColor: TColor.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),
            onDateSelected: (date) {
              setState(() {
                _selectedDateAppBBar = date;
              });
            },
            selectedDayLogo: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Breakfast",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${breakfastArr.length} meals | 230 Calories",

                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: breakfastArr.length,
                    itemBuilder: (context, index) {
                      var mObj = breakfastArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(mObj: mObj, index: index);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lunch",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${lunchArr.length} meals | 450 Calories",

                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lunchArr.length,
                    itemBuilder: (context, index) {
                      var mObj = lunchArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(mObj: mObj, index: index);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Snacks",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${snacksArr.length} meals | 150 Calories",

                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snacksArr.length,
                    itemBuilder: (context, index) {
                      var mObj = snacksArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(mObj: mObj, index: index);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dinner",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${dinnerArr.length} meals | 350 Calories",

                            style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dinnerArr.length,
                    itemBuilder: (context, index) {
                      var mObj = dinnerArr[index] as Map? ?? {};
                      return MealFoodScheduleRow(mObj: mObj, index: index);
                    },
                  ),
                  SizedBox(height: media.width * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today Meal Nutritions",
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: NutritionArr.length,
                    itemBuilder: (context, index) {
                      var nObj = NutritionArr[index] as Map? ?? {};
                      return NutritionRow(nObj: nObj);
                    },
                  ),
                  SizedBox(height: media.width * 0.05),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

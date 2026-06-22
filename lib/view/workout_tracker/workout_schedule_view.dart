import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:intl/intl.dart';

class WorkoutScheduleView extends StatefulWidget {
  const WorkoutScheduleView({super.key});

  @override
  State<WorkoutScheduleView> createState() => _WorkoutScheduleViewState();
}

class _WorkoutScheduleViewState extends State<WorkoutScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();
  late DateTime _selectedDateAppBBar;
  @override
  void initState() {
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  List eventArr = [
    {"name": "Ab Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Upper Body Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Lower Body Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Ab Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Upper Body Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Lower Body Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Ab Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Upper Body Workout", "start_time": "27/08/2026 03:00 PM"},
    {"name": "Lower Body Workout", "start_time": "27/08/2026 03:00 PM"},
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
              width: 15,
              height: 15,
            ),
          ),
        ),
        title: Text(
          'Workout Schedule',
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
            titleSpaceBetween: 15,
            dayBGColor: Colors.grey.withOpacity(0.15),
            backgroundColor: Colors.transparent,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: Colors.white,
            //fullCalendar: false,
            dateColor: Colors.black,
            locale: 'en',
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
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: media.width * 1.5,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Text(
                              getTime(index * 60),
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 35,
                                  width: media.width * 0.5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: TColor.secondaryG,
                                    ),
                                    borderRadius: BorderRadius.circular(17.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Ab Workout",
                                      style: TextStyle(
                                        color: TColor.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      color: TColor.gray.withOpacity(0.2),
                    );
                  },
                  itemCount: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTime(int value, {String formatStr = "hh:mm a"}) {
    var format = DateFormat(formatStr);
    return format.format(
      DateTime.fromMillisecondsSinceEpoch(value * 60 * 1000, isUtc: true),
    );
  }

  DateTime stringToDate(String dateStr, {String formatStr = "hh:mm a"}) {
    var format = DateFormat(formatStr);
    return format.parse(dateStr);
  }

  DateTime dateToStartDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}

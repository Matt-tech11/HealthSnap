import 'package:flutter/material.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/view/meal_planner/meal_planner_view.dart';
import 'package:healthsnap/view/workout_tracker/workout_tracker_view.dart';

class Selectedview extends StatelessWidget {
  const Selectedview({super.key});

  @override
  Widget build(BuildContext context) {
    //var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              title: "Workout Tracker",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorkoutTrackerView(),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            RoundButton(
              title: "Meal Planner",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MealPlannerView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

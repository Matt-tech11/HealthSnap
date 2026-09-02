import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class WorkoutItem {
  final String id;
  final String name;
  final String image;
  final String kCal;
  final String time;
  final double progress;

  const WorkoutItem({
    required this.id,
    required this.name,
    required this.image,
    required this.kCal,
    required this.time,
    required this.progress,
  });
}

class UpcomingWorkoutItem {
  final String id;
  final String title;
  final String time;
  final String image;
  final bool isEnabled;

  const UpcomingWorkoutItem({
    required this.id,
    required this.title,
    required this.time,
    required this.image,
    this.isEnabled = true,
  });

  UpcomingWorkoutItem copyWith({
    String? id,
    String? title,
    String? time,
    String? image,
    bool? isEnabled,
  }) {
    return UpcomingWorkoutItem(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      image: image ?? this.image,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}

class WorkoutState {
  final List<WorkoutItem> recentWorkouts;
  final List<UpcomingWorkoutItem> upcomingWorkouts;
  final int totalCaloriesBurned;
  final int targetCalories;

  const WorkoutState({
    required this.recentWorkouts,
    required this.upcomingWorkouts,
    this.totalCaloriesBurned = 530,
    this.targetCalories = 1000,
  });

  WorkoutState copyWith({
    List<WorkoutItem>? recentWorkouts,
    List<UpcomingWorkoutItem>? upcomingWorkouts,
    int? totalCaloriesBurned,
    int? targetCalories,
  }) {
    return WorkoutState(
      recentWorkouts: recentWorkouts ?? this.recentWorkouts,
      upcomingWorkouts: upcomingWorkouts ?? this.upcomingWorkouts,
      totalCaloriesBurned: totalCaloriesBurned ?? this.totalCaloriesBurned,
      targetCalories: targetCalories ?? this.targetCalories,
    );
  }
}

class WorkoutNotifier extends StateNotifier<WorkoutState> {
  WorkoutNotifier()
    : super(
        const WorkoutState(
          recentWorkouts: [
            WorkoutItem(
              id: '1',
              name: 'Full Body Workout',
              image: 'assets/img/workout_pic.png',
              kCal: '180',
              time: '20',
              progress: 0.3,
            ),
            WorkoutItem(
              id: '2',
              name: 'Lower Body Workout',
              image: 'assets/img/workout_pic1.png',
              kCal: '200',
              time: '30',
              progress: 0.4,
            ),
            WorkoutItem(
              id: '3',
              name: 'Abs Workout',
              image: 'assets/img/workout_pic2.png',
              kCal: '150',
              time: '40',
              progress: 0.7,
            ),
          ],
          upcomingWorkouts: [
            UpcomingWorkoutItem(
              id: 'u1',
              title: 'Fullbody Workout',
              time: 'Today, 03:00pm',
              image: 'assets/img/workout_pic.png',
              isEnabled: true,
            ),
            UpcomingWorkoutItem(
              id: 'u2',
              title: 'Upperbody Workout',
              time: 'June 05, 02:00pm',
              image: 'assets/img/workout_pic1.png',
              isEnabled: false,
            ),
          ],
        ),
      );

  void toggleUpcomingWorkout(String id, bool value) {
    final updatedList = state.upcomingWorkouts.map((item) {
      if (item.id == id) {
        return item.copyWith(isEnabled: value);
      }
      return item;
    }).toList();

    state = state.copyWith(upcomingWorkouts: updatedList);
  }

  void addUpcomingWorkout(UpcomingWorkoutItem item) {
    state = state.copyWith(upcomingWorkouts: [...state.upcomingWorkouts, item]);
  }
}

final workoutProvider = StateNotifierProvider<WorkoutNotifier, WorkoutState>((
  ref,
) {
  return WorkoutNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class WaterIntakeEntry {
  final String id;
  final String timeRange;
  final String amount;

  const WaterIntakeEntry({
    required this.id,
    required this.timeRange,
    required this.amount,
  });
}

class MealItem {
  final String id;
  final String name;
  final String image;
  final String category;
  final String size;
  final String time;
  final String kCal;

  const MealItem({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.size,
    required this.time,
    required this.kCal,
  });
}

class MealState {
  final List<WaterIntakeEntry> waterIntakeList;
  final int currentWaterMl;
  final int targetWaterMl;
  final List<MealItem> recommendedMeals;

  const MealState({
    required this.waterIntakeList,
    this.currentWaterMl = 2800,
    this.targetWaterMl = 4000,
    required this.recommendedMeals,
  });

  MealState copyWith({
    List<WaterIntakeEntry>? waterIntakeList,
    int? currentWaterMl,
    int? targetWaterMl,
    List<MealItem>? recommendedMeals,
  }) {
    return MealState(
      waterIntakeList: waterIntakeList ?? this.waterIntakeList,
      currentWaterMl: currentWaterMl ?? this.currentWaterMl,
      targetWaterMl: targetWaterMl ?? this.targetWaterMl,
      recommendedMeals: recommendedMeals ?? this.recommendedMeals,
    );
  }
}

class MealNotifier extends StateNotifier<MealState> {
  MealNotifier()
    : super(
        const MealState(
          waterIntakeList: [
            WaterIntakeEntry(id: 'w1', timeRange: '6am-9am', amount: '600ml'),
            WaterIntakeEntry(id: 'w2', timeRange: '9am-11am', amount: '500ml'),
            WaterIntakeEntry(id: 'w3', timeRange: '11am-2pm', amount: '100ml'),
            WaterIntakeEntry(id: 'w4', timeRange: '2pm-4pm', amount: '700ml'),
            WaterIntakeEntry(id: 'w5', timeRange: '4pm-now', amount: '900ml'),
          ],
          recommendedMeals: [
            MealItem(
              id: 'm1',
              name: 'Honey Pancake',
              image: 'assets/img/rd_1.png',
              category: 'Breakfast',
              size: 'Easy | 30mins',
              time: '180kCal',
              kCal: '180',
            ),
            MealItem(
              id: 'm2',
              name: 'Canai Bread',
              image: 'assets/img/m_2.png',
              category: 'Breakfast',
              size: 'Easy | 20mins',
              time: '230kCal',
              kCal: '230',
            ),
          ],
        ),
      );

  void addWaterIntake(String timeRange, int amountMl) {
    final newEntry = WaterIntakeEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      timeRange: timeRange,
      amount: '${amountMl}ml',
    );
    state = state.copyWith(
      waterIntakeList: [...state.waterIntakeList, newEntry],
      currentWaterMl: state.currentWaterMl + amountMl,
    );
  }
}

final mealProvider = StateNotifierProvider<MealNotifier, MealState>((ref) {
  return MealNotifier();
});

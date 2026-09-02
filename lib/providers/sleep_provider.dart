import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class AlarmItem {
  final String id;
  final String title;
  final String time;
  final bool isEnabled;
  final String repeatInfo;

  const AlarmItem({
    required this.id,
    required this.title,
    required this.time,
    this.isEnabled = true,
    this.repeatInfo = 'Mon, Tue, Wed, Thu, Fri',
  });

  AlarmItem copyWith({
    String? id,
    String? title,
    String? time,
    bool? isEnabled,
    String? repeatInfo,
  }) {
    return AlarmItem(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      isEnabled: isEnabled ?? this.isEnabled,
      repeatInfo: repeatInfo ?? this.repeatInfo,
    );
  }
}

class SleepState {
  final double lastSleepDurationHours;
  final double sleepTargetHours;
  final List<AlarmItem> alarms;

  const SleepState({
    this.lastSleepDurationHours = 8.25, // 8h 15m
    this.sleepTargetHours = 8.0,
    required this.alarms,
  });

  SleepState copyWith({
    double? lastSleepDurationHours,
    double? sleepTargetHours,
    List<AlarmItem>? alarms,
  }) {
    return SleepState(
      lastSleepDurationHours:
          lastSleepDurationHours ?? this.lastSleepDurationHours,
      sleepTargetHours: sleepTargetHours ?? this.sleepTargetHours,
      alarms: alarms ?? this.alarms,
    );
  }
}

class SleepNotifier extends StateNotifier<SleepState> {
  SleepNotifier()
    : super(
        const SleepState(
          alarms: [
            AlarmItem(
              id: 'a1',
              title: 'Bedtime',
              time: '09:00 PM',
              isEnabled: true,
              repeatInfo: 'Everyday',
            ),
            AlarmItem(
              id: 'a2',
              title: 'Alarm',
              time: '05:10 AM',
              isEnabled: true,
              repeatInfo: 'Mon, Tue, Wed, Thu, Fri',
            ),
          ],
        ),
      );

  void toggleAlarm(String id, bool value) {
    final updatedAlarms = state.alarms.map((alarm) {
      if (alarm.id == id) {
        return alarm.copyWith(isEnabled: value);
      }
      return alarm;
    }).toList();

    state = state.copyWith(alarms: updatedAlarms);
  }

  void addAlarm(AlarmItem alarm) {
    state = state.copyWith(alarms: [...state.alarms, alarm]);
  }
}

final sleepProvider = StateNotifierProvider<SleepNotifier, SleepState>((ref) {
  return SleepNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserModel {
  final String name;
  final String email;
  final String program;
  final String height;
  final String weight;
  final String age;
  final String dateOfBirth;
  final String gender;
  final bool isDarkMode;
  final bool notificationsEnabled;

  const UserModel({
    this.name = 'Hannah Lisa',
    this.email = 'hannah.lisa@example.com',
    this.program = 'Lose Weight',
    this.height = '180 cm',
    this.weight = '65 kg',
    this.age = '22 y.o.',
    this.dateOfBirth = '2004-05-15',
    this.gender = 'Female',
    this.isDarkMode = false,
    this.notificationsEnabled = true,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? program,
    String? height,
    String? weight,
    String? age,
    String? dateOfBirth,
    String? gender,
    bool? isDarkMode,
    bool? notificationsEnabled,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      program: program ?? this.program,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(const UserModel());

  void updateProfile({
    String? name,
    String? email,
    String? program,
    String? height,
    String? weight,
    String? age,
    String? dateOfBirth,
    String? gender,
  }) {
    state = state.copyWith(
      name: name,
      email: email,
      program: program,
      height: height,
      weight: weight,
      age: age,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
  }

  static String calculateAgeString(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return '$age y.o.';
  }

  void toggleDarkMode(bool value) {
    state = state.copyWith(isDarkMode: value);
  }

  void toggleNotifications(bool value) {
    state = state.copyWith(notificationsEnabled: value);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});

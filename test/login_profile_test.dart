import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthsnap/providers/user_provider.dart';
import 'package:healthsnap/view/login/complete_profile_view.dart';
import 'package:healthsnap/view/login/welcome_view.dart';

void main() {
  group('Profile Setup Unit Tests', () {
    test('UserNotifier calculates age correctly from birth date', () {
      final birthDate = DateTime(1995, 5, 10);
      final ageStr = UserNotifier.calculateAgeString(birthDate);
      expect(ageStr, contains('y.o.'));
    });

    test('UserNotifier updates and loads all Profile entity fields correctly', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Verify default state loads
      final initialUser = container.read(userProvider);
      expect(initialUser.name, equals('Hannah Lisa'));

      // Update Profile entity setup (age, sex, height, weight + program, etc.)
      container.read(userProvider.notifier).updateProfile(
            name: 'Alex Johnson',
            email: 'alex@example.com',
            gender: 'Male',
            dateOfBirth: '1998-04-12',
            age: '28 y.o.',
            height: '175 cm',
            weight: '70 kg',
            program: 'Lean & Tone',
          );

      // Verify save/load of Profile setup
      final updatedUser = container.read(userProvider);
      expect(updatedUser.name, equals('Alex Johnson'));
      expect(updatedUser.email, equals('alex@example.com'));
      expect(updatedUser.gender, equals('Male'));
      expect(updatedUser.dateOfBirth, equals('1998-04-12'));
      expect(updatedUser.age, equals('28 y.o.'));
      expect(updatedUser.height, equals('175 cm'));
      expect(updatedUser.weight, equals('70 kg'));
      expect(updatedUser.program, equals('Lean & Tone'));
    });
  });

  group('CompleteProfileView & WelcomeView Widget Tests', () {
    testWidgets('CompleteProfileView loads pre-filled user state and saves edits on Next tap', (WidgetTester tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(userProvider.notifier).updateProfile(
            gender: 'Male',
            height: '185 cm',
            weight: '80 kg',
          );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: CompleteProfileView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Verify loading of pre-filled values
      expect(find.text('Let\'s complete your profile'), findsOneWidget);
      expect(find.text('Male'), findsOneWidget);
      expect(find.text('80'), findsOneWidget);
      expect(find.text('185'), findsOneWidget);

      // Enter new weight and height values
      await tester.enterText(find.widgetWithText(TextField, '80'), '82');
      await tester.enterText(find.widgetWithText(TextField, '185'), '186');

      // Tap Next button to save profile setup
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Verify saved state in userProvider
      final savedUser = container.read(userProvider);
      expect(savedUser.weight, equals('82 kg'));
      expect(savedUser.height, equals('186 cm'));
      expect(savedUser.gender, equals('Male'));
    });

    testWidgets('WelcomeView loads personalized profile user name', (WidgetTester tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(userProvider.notifier).updateProfile(
            name: 'Sarah Connor',
          );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: WelcomeView(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Welcome, Sarah Connor'), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/round_textfield.dart';
import 'package:healthsnap/providers/user_provider.dart';
import 'package:healthsnap/view/login/what_your_goal_view.dart';
import 'package:intl/intl.dart';

class CompleteProfileView extends ConsumerStatefulWidget {
  const CompleteProfileView({super.key});

  @override
  ConsumerState<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends ConsumerState<CompleteProfileView> {
  late TextEditingController txtDate;
  late TextEditingController txtWeight;
  late TextEditingController txtHeight;
  String? selectGender;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);
    selectGender = user.gender.isNotEmpty ? user.gender : "Female";
    txtDate = TextEditingController(text: user.dateOfBirth);
    txtWeight = TextEditingController(text: user.weight.replaceAll(RegExp(r'[^0-9.]'), ''));
    txtHeight = TextEditingController(text: user.height.replaceAll(RegExp(r'[^0-9.]'), ''));
    if (user.dateOfBirth.isNotEmpty) {
      try {
        selectedDate = DateTime.parse(user.dateOfBirth);
      } catch (_) {}
    }
  }

  @override
  void dispose() {
    txtDate.dispose();
    txtWeight.dispose();
    txtHeight.dispose();
    super.dispose();
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime initial = selectedDate ?? DateTime(2000, 1, 1);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        txtDate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/vector_section.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: media.width * 0.05),
                Text(
                  "Let's complete your profile",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "It will help us to know more about you!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(height: media.width * 0.05),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.LightGray,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Image.asset(
                                "assets/img/gender.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: TColor.gray,
                              ),
                            ),

                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectGender,
                                  items: ["Male", "Female"]
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
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        selectGender = value;
                                      });
                                    }
                                  },
                                  isExpanded: true,

                                  hint: Text(
                                    "Choose Gender",
                                    style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      SizedBox(height: media.width * 0.04),
                      GestureDetector(
                        onTap: () => _selectDateOfBirth(context),
                        child: AbsorbPointer(
                          child: RoundTextField(
                            controller: txtDate,
                            hintText: "Date of Birth",
                            icon: "assets/img/calendar.png",
                            margin: const EdgeInsets.only(bottom: 0),
                          ),
                        ),
                      ),

                      SizedBox(height: media.width * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtWeight,
                              hintText: "Your weight",
                              icon: "assets/img/weight.png",
                              keyboardType: TextInputType.number,
                              margin: const EdgeInsets.only(bottom: 0),
                            ),
                          ),

                          const SizedBox(width: 8),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: media.width * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtHeight,
                              hintText: "Your Height",
                              icon: "assets/img/height.png",
                              keyboardType: TextInputType.number,
                              margin: const EdgeInsets.only(bottom: 0),
                            ),
                          ),

                          const SizedBox(width: 8),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style: TextStyle(
                                color: TColor.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: media.width * 0.07),
                      RoundButton(
                        title: "Next",
                        onPressed: () {
                          final weightVal = txtWeight.text.trim();
                          final heightVal = txtHeight.text.trim();
                          final computedAge = selectedDate != null
                              ? UserNotifier.calculateAgeString(selectedDate!)
                              : null;

                          ref.read(userProvider.notifier).updateProfile(
                                gender: selectGender,
                                dateOfBirth: txtDate.text.trim().isNotEmpty ? txtDate.text.trim() : null,
                                age: computedAge,
                                weight: weightVal.isNotEmpty ? "$weightVal kg" : null,
                                height: heightVal.isNotEmpty ? "$heightVal cm" : null,
                              );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WhatYourGoalView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

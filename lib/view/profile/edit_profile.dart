import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/round_textfield.dart';
import 'package:healthsnap/providers/user_provider.dart';

class EditProfileView extends ConsumerStatefulWidget {
  final DateTime date;
  const EditProfileView({super.key, required this.date});

  @override
  ConsumerState<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  late TextEditingController txtFirstName;
  late TextEditingController txtLastName;
  late TextEditingController txtEmail;
  late TextEditingController txtWeight;
  late TextEditingController txtHeight;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userProvider);
    final nameParts = user.name.split(" ");
    txtFirstName = TextEditingController(text: nameParts.isNotEmpty ? nameParts.first : "");
    txtLastName = TextEditingController(text: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "");
    txtEmail = TextEditingController(text: user.email);
    txtWeight = TextEditingController(text: user.weight.replaceAll(RegExp(r'[^0-9.]'), ''));
    txtHeight = TextEditingController(text: user.height.replaceAll(RegExp(r'[^0-9.]'), ''));
  }

  @override
  void dispose() {
    txtFirstName.dispose();
    txtLastName.dispose();
    txtEmail.dispose();
    txtWeight.dispose();
    txtHeight.dispose();
    super.dispose();
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
              color: Colors.black,
              width: 13,
              height: 13,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: TColor.black,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/img/latest_pic.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: TColor.primaryG),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/img/camera.png",
                          width: 15,
                          height: 15,
                          color: TColor.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),
                RoundTextField(
                  controller: txtFirstName,
                  hintText: "First Name",
                  icon: "assets/img/profile.png",
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
                SizedBox(height: media.width * 0.02),
                RoundTextField(
                  controller: txtLastName,
                  hintText: "Last Name",
                  icon: "assets/img/profile.png",
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
                SizedBox(height: media.width * 0.02),
                RoundTextField(
                  controller: txtEmail,
                  hintText: "Email",
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
                SizedBox(height: media.width * 0.04),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              controller: txtWeight,
                              hintText: "Your weight",
                              icon: "assets/img/weight.png",
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
                        title: "Save Profile",
                        onPressed: () {
                          final fullName = "${txtFirstName.text.trim()} ${txtLastName.text.trim()}".trim();
                          ref.read(userProvider.notifier).updateProfile(
                                name: fullName.isNotEmpty ? fullName : null,
                                email: txtEmail.text.trim().isNotEmpty ? txtEmail.text.trim() : null,
                                weight: txtWeight.text.trim().isNotEmpty ? "${txtWeight.text.trim()}kg" : null,
                                height: txtHeight.text.trim().isNotEmpty ? "${txtHeight.text.trim()}cm" : null,
                              );
                          Navigator.pop(context);
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

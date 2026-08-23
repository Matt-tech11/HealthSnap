import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/round_textfield.dart';
// import 'package:healthsnap/view/profile/profile_view.dart';
//import 'package:healthsnap/view/workout_tracker/workout_schedule_view.dart';

class EditProfileView extends StatefulWidget {
  final DateTime date;
  const EditProfileView({super.key, required this.date});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();

  // bool positive = false;
  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
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
                  hintText: "First Name",
                  icon: "assets/img/profile.png",
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),

                SizedBox(height: media.width * 0.02),
                RoundTextField(
                  hintText: "Last Name",
                  icon: "assets/img/profile.png",
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),

                SizedBox(height: media.width * 0.02),
                RoundTextField(
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
                      Container(
                        decoration: BoxDecoration(
                          color: TColor.LightGray,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //child: Row(
                        // children: [
                        //   Container(
                        //     alignment: Alignment.center,
                        //     width: 50,
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(
                        //       horizontal: 15,
                        //     ),
                        //     child: Image.asset(
                        //       "assets/img/gender.png",
                        //       width: 20,
                        //       height: 20,
                        //       fit: BoxFit.contain,
                        //       color: TColor.gray,
                        //     ),
                        //   ),

                        //   Expanded(
                        //     child: DropdownButtonHideUnderline(
                        //       child: DropdownButton(
                        //         items: ["Male", "Female"]
                        //             .map(
                        //               (name) => DropdownMenuItem(
                        //                 value: name,
                        //                 child: Text(
                        //                   name,
                        //                   style: TextStyle(
                        //                     color: TColor.gray,
                        //                     fontSize: 14,
                        //                   ),
                        //                 ),
                        //               ),
                        //             )
                        //             .toList(),
                        //         onChanged: (value) {},
                        //         isExpanded: true,

                        //         hint: Text(
                        //           "Choose Gender",
                        //           style: TextStyle(
                        //             color: TColor.gray,
                        //             fontSize: 12,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   const SizedBox(width: 8),
                        // ],
                        //),
                      ),

                      // SizedBox(height: media.width * 0.04),
                      // RoundTextField(
                      //   controller: txtDate,
                      //   hintText: "Date of Birth",
                      //   icon: "assets/img/calendar.png",
                      //   margin: const EdgeInsets.only(bottom: 0),
                      // ),

                      // SizedBox(height: media.width * 0.04),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const ProfileView(),
                          //   ),
                          // );
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

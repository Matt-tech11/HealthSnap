import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/settings_row.dart';
import 'package:healthsnap/common_widget/title_subtitle_cell.dart';
import 'package:healthsnap/providers/user_provider.dart';
import 'package:healthsnap/view/profile/edit_profile.dart';
import '../../common/color_extension.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  List accountArr = [
    {"img": "assets/img/profile2.png", "name": "Personal Data", "tag": "1"},
    {"img": "assets/img/document.png", "name": "Achievements", "tag": "2"},
    {"img": "assets/img/graph.png", "name": "Health Stats", "tag": "3"},
    {"img": "assets/img/chart.png", "name": "Progress Charts", "tag": "4"},
  ];
  List otherArr = [
    {"img": "assets/img/message.png", "name": "Contact Us", "tag": "5"},
    {"img": "assets/img/privacy.png", "name": "Privacy Policy", "tag": "6"},
  ];

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(userProvider.notifier).toggleDarkMode(!userState.isDarkMode);
            },
            icon: Icon(isDark || userState.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/img/latest_pic.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userState.name,
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          userState.email,
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    height: 30,
                    child: RoundButton(
                      title: "Edit",
                      type: RoundButtonType.bgGradient,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileView(
                              date: DateTime.now(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "Height",
                      subtitle: userState.height,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "Weight",
                      subtitle: userState.weight,
                    ),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TitleSubtitleCell(
                      title: "Age",
                      subtitle: userState.age,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: accountArr.length,
                      itemBuilder: ((context, index) {
                        var iObj = accountArr[index] as Map? ?? {};
                        return SettingsRow(
                          title: iObj["name"].toString(),
                          icon: iObj["img"].toString(),
                          onPressed: () {},
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notification",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 55,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/notification.png",
                            height: 15,
                            width: 15,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              "Pop-up Notifications",
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          CustomAnimatedToggleSwitch<bool>(
                            current: userState.notificationsEnabled,
                            values: const [false, true],
                            spacing: 0.0,
                            indicatorSize: const Size.square(30.0),
                            animationDuration: const Duration(
                              milliseconds: 200,
                            ),
                            animationCurve: Curves.linear,
                            onChanged: (b) {
                              ref.read(userProvider.notifier).toggleNotifications(b);
                            },
                            iconBuilder: (context, local, global) {
                              return const SizedBox();
                            },
                            cursors: const ToggleCursors(
                              defaultCursor: SystemMouseCursors.click,
                            ),
                            onTap: (info) {
                              ref
                                  .read(userProvider.notifier)
                                  .toggleNotifications(!userState.notificationsEnabled);
                            },
                            iconsTappable: false,
                            wrapperBuilder: (context, global, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 10.0,
                                    right: 10.0,
                                    height: 30.0,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: TColor.secondaryG,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  child,
                                ],
                              );
                            },
                            foregroundIndicatorBuilder: (context, global) {
                              return SizedBox.fromSize(
                                size: const Size(10, 10),
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 1.1,
                                        offset: Offset(0, 0.8),
                                      ),
                                    ],
                                  ),
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
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Others",
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: otherArr.length,
                      itemBuilder: ((context, index) {
                        var iObj = otherArr[index] as Map? ?? {};
                        return SettingsRow(
                          title: iObj["name"].toString(),
                          icon: iObj["img"].toString(),
                          onPressed: () {},
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

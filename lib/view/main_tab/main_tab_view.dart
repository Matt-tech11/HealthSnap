import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/tab_button.dart';
import 'package:healthsnap/providers/navigation_provider.dart';
import 'package:healthsnap/view/home/home_view.dart';
import 'package:healthsnap/view/main_tab/selectedView.dart';
import 'package:healthsnap/view/photo_progress/photo_progress_view.dart';
import 'package:healthsnap/view/profile/profile_view.dart';

class MainTabView extends ConsumerStatefulWidget {
  const MainTabView({super.key});

  @override
  ConsumerState<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends ConsumerState<MainTabView> {
  final pageStorageBucket = PageStorageBucket();

  Widget _getTabWidget(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const Selectedview();
      case 2:
        return const PhotoProgressView();
      case 3:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectTab = ref.watch(navigationProvider);
    final currentTab = _getTabWidget(selectTab);

    return Scaffold(
      backgroundColor: TColor.white,
      body: PageStorage(bucket: pageStorageBucket, child: currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.primaryG),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 2),
              ],
            ),
            child: Image.asset(
              "assets/img/ai.png",
              width: 30,
              height: 30,
              color: TColor.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: TColor.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                icon: "assets/img/home.png",
                selectIcon: "assets/img/home_1.png",
                isActive: selectTab == 0,
                onTap: () {
                  ref.read(navigationProvider.notifier).setTab(0);
                },
              ),
              TabButton(
                icon: "assets/img/activity.png",
                selectIcon: "assets/img/activity_1.png",
                isActive: selectTab == 1,
                onTap: () {
                  ref.read(navigationProvider.notifier).setTab(1);
                },
              ),
              const SizedBox(width: 40),
              TabButton(
                icon: "assets/img/camera.png",
                selectIcon: "assets/img/camera_1.png",
                isActive: selectTab == 2,
                onTap: () {
                  ref.read(navigationProvider.notifier).setTab(2);
                },
              ),
              TabButton(
                icon: "assets/img/profile.png",
                selectIcon: "assets/img/profile_1.png",
                isActive: selectTab == 3,
                onTap: () {
                  ref.read(navigationProvider.notifier).setTab(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

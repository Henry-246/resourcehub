import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.activepage),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.activePageIndex.value,
          onDestinationSelected: (value) {
            controller.changeActivePage(value);
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 100,
          destinations: const [
            NavigationDestination(
              icon: Icon(Ionicons.grid_outline),
              label: 'Courses',
              selectedIcon: Icon(Ionicons.grid),
            ),
            // NavigationDestination(
            //   icon: Icon(Ionicons.add_outline),
            //   label: 'Skill Up',
            //   selectedIcon: Icon(Ionicons.add),
            // ),
            NavigationDestination(
              icon: Icon(Ionicons.apps_outline),
              label: 'Ask Ai',
              selectedIcon: Icon(Ionicons.apps),
            ),
            NavigationDestination(
              icon: Icon(Ionicons.settings_outline),
              label: 'Settings',
              selectedIcon: Icon(Ionicons.settings),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/courses/courses.dart';
import 'package:resource/app/features/home/home_controller.dart';
import 'package:resource/app/menuscreen.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuScreen(
        onItemSelected: (index) {
            controller.changeActivePage(index);
            zoomDrawerController.close!();
          },
      ),
      mainScreen: Obx(() => controller.activepage),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuBackgroundColor: Colors.blue.shade100,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Obx(() => controller.activepage),
  //     bottomNavigationBar: Obx(
  //       () => NavigationBar(
  //         elevation: 2,
  //         indicatorColor: Colors.transparent,
  //         indicatorShape:  const Border(
  //           bottom: BorderSide(
  //             width: 1,
  //           ),
  //         ),
  //         backgroundColor: Colors.grey[200],
  //         selectedIndex: controller.activePageIndex.value,
  //         onDestinationSelected: (value) {
  //           controller.changeActivePage(value);
  //         },
  //         height: 100,
  //         destinations: const [
  //           NavigationDestination(
  //             icon: Icon(Ionicons.folder_outline),
  //             label: 'Courses',
  //             selectedIcon: Icon(Ionicons.folder),
  //           ),
  //           // NavigationDestination(
  //           //   icon: Icon(Ionicons.add_outline),
  //           //   label: 'Skill Up',
  //           //   selectedIcon: Icon(Ionicons.add),
  //           // ),
  //           NavigationDestination(
  //             icon: Icon(Ionicons.bulb_outline),
  //             label: 'Ask Ai',
  //             selectedIcon: Icon(Ionicons.bulb),
  //           ),
  //           NavigationDestination(
  //             icon: Icon(Ionicons.settings_outline),
  //             label: 'Settings',
  //             selectedIcon: Icon(Ionicons.settings),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}

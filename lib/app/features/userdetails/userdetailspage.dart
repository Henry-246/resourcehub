import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/routes/routes.dart';
import 'package:resource/app/features/userdetails/userdetailscontroller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserDetailsPage extends GetView<UserDetailsController> {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? getTitleLarge = Get.textTheme.titleLarge;
    TextStyle newTitleLargeStyle =
        getTitleLarge?.copyWith(color: Colors.white) ?? const TextStyle();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 600,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: Get.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Programme',
                    style: Get.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          prefixIcon: Icon(Ionicons.search),
                          hintText: 'Search Programme',
                          prefixIconColor: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Level',
                    style: Get.textTheme.bodyMedium,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 4,
                    labels: controller.level,
                    onToggle: (index) {
                      index = index ?? 0;
                    },
                    minHeight: 80,
                    minWidth: double.infinity,
                    fontSize: 20,
                    activeBgColor: [Colors.blue.shade100],
                    activeFgColor: Colors.blue.shade500,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.grey[400],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Semester',
                    style: Get.textTheme.bodyMedium,
                  ),
                  ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    labels: controller.level,
                    onToggle: (index) {
                      index = index ?? 0;
                    },
                    minHeight: 80,
                    minWidth: 200,
                    fontSize: 20,
                    activeBgColor: [Colors.blue.shade100],
                    activeFgColor: Colors.blue.shade500,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.grey[400],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.offNamed(AppRoutes.home),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: Text(
                              'Cancel',
                              style: Get.textTheme.titleLarge,
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Get.offNamed(AppRoutes.home),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: Text(
                              'Confirm',
                              style: newTitleLargeStyle,
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

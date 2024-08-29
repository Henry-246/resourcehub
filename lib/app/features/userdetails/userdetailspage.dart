import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resource/app/features/userdetails/userdetailscontroller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserDetailsPage extends GetView<UserDetailsController> {
  const UserDetailsPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    TextStyle? getTitleLarge = Get.textTheme.titleLarge;
    TextStyle newTitleLargeStyle =
        getTitleLarge?.copyWith(color: Colors.white) ?? const TextStyle();
    final UserDetailsController meyou = Get.put(UserDetailsController());
    
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color:
                    Colors.black.withOpacity(0.1), // Adjust opacity as needed
              ),
            ),
            Center(
              child: Obx(
                () {
                  if (controller.isLoading.value) {
                    return LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.blue,
                      size: 90,
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(12),
                    width: 600,
                    height: 460,
                    decoration: BoxDecoration(
                      color: Colors.grey[100]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          // child: Autocomplete(
                          //   optionsBuilder: (textEditingValue) {
                          //     if (textEditingValue.text == '') {
                          //       return const Iterable<String>.empty();
                          //     }
                          //     return controller.coursename.where(
                          //       (String item) {
                          //         return item.contains(
                          //             textEditingValue.text.toLowerCase());
                          //       },
                          //     );
                          //   },
                          //   onSelected: (option) {
                          //     print('Selected: $option');
                          //   },
                          // ),
                          child: Center(
                            child: Form(
                              key: controller.formKey,
                              child: TypeAheadField(
                                
                                onSelected: (value) {
                                  meyou.myProgrammeText.value.text = value;
                                  controller.selectedProgramme.value = value;
                                },
                                controller: meyou.myProgrammeText.value,
                                builder: (context, controller, focusNode) {
                                  return TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please type in your course";
                                      }
                                      return null;
                                    },
                                    controller: meyou.myProgrammeText.value,
                                    focusNode: focusNode,
                                    
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(16),
                                        prefixIcon: Icon(Ionicons.search),
                                        border: InputBorder.none,
                                        prefixIconColor: Colors.blue),
                                  );
                                },
                                suggestionsCallback: (pattern) async {
                                  return controller.programmeName
                                      .where((name) => name
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList();
                                },
                                itemBuilder: (context, String value) {
                                  return ListTile(
                                    title: Text(value),
                                  );
                                },
                              ),
                            ),
                          ),
                          // child: const TextField(
                          //   cursorColor: Colors.blue,
                          //   decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.all(16),
                          //       border: InputBorder.none,
                          //       prefixIcon: Icon(Ionicons.search),
                          //       hintText: 'Search Programme',
                          //       prefixIconColor: Colors.blue),
                          // ),
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
                            controller.selectedLevel.value =
                                controller.level[index];
                          },
                          minHeight: screenwidth * 0.15,
                          minWidth: double.infinity,
                          fontSize: 20,
                          activeBgColor: [Colors.blue.shade100],
                          activeFgColor: Colors.blue.shade500,
                          inactiveBgColor: Colors.white,
                          inactiveFgColor: Colors.grey[400],
                          cornerRadius: 12,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Semester',
                          style: Get.textTheme.bodyMedium,
                        ),
                        ToggleSwitch(
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: controller.semester,
                          onToggle: (index) {
                            index = index ?? 0;
                            controller.selectedSemester.value =
                                controller.semester[index];
                          },
                          minHeight: screenwidth * 0.15,
                          minWidth: double.infinity,
                          fontSize: 20,
                          activeBgColor: [Colors.blue.shade100],
                          activeFgColor: Colors.blue.shade500,
                          inactiveBgColor: Colors.white,
                          inactiveFgColor: Colors.grey[400],
                          cornerRadius: 12,
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.saveSelections();
                            }
                            return;
                          },
                          child: Container(
                            height: screenwidth * 0.15,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade400,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: newTitleLargeStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

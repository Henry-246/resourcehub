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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.blue,
                  size: 90,
                );
              }
              return Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      child: Form(
                        key: formKey,
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
                      labels: controller.semester,
                      onToggle: (index) {
                        index = index ?? 0;
                        controller.selectedSemester.value =
                            controller.semester[index];
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
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.saveSelections();
                          }
                          return;
                        },
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
                            ),
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
      ),
    );
  }
}

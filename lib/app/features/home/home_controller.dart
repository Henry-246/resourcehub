import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/app/features/ai/askai.dart';
import 'package:resource/app/features/courses/courses.dart';
import 'package:resource/app/features/settings/settings.dart';
import 'package:resource/app/features/skillup/skills.dart';

class HomeController extends GetxController {
  List pages = const [
    CoursePage(),
    // SkillsUpPage(),
    AskAiPage(),
    SettingsPage()
  ];
  RxInt activePageIndex = 0.obs;
  Widget get activepage => pages[activePageIndex.value];

  void changeActivePage(int index) {
    activePageIndex.value = index;
  }
}

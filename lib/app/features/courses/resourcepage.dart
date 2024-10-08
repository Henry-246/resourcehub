import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/courses/tabs/lecture_resource_page.dart';
import 'package:resource/app/features/courses/tabs/question_resource_page.dart';
import 'package:resource/app/features/courses/tabs/youtube_resource_page.dart';
import 'package:resource/app/neumorphic.dart';

class ResourcePage extends StatefulWidget {
  final String coursename;
  final List lectureResource;
  final List youtubeResource;
  final List pastQuestion;
  const ResourcePage({
    super.key,
    required this.coursename,
    required this.lectureResource,
    required this.youtubeResource,
    required this.pastQuestion,
  });

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NeumorphicContainer(
                      onTap: () {
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.coursename,
                        style:  TextStyle(
                          fontSize: screenwidth * 0.07,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const TabBar(
                tabAlignment: TabAlignment.center,
                tabs: [
                  Tab(
                    icon: Icon(Ionicons.book),
                    text: 'Resources',
                  ),
                  Tab(
                    icon: Icon(Ionicons.logo_youtube),
                    text: 'Youtube',
                  ),
                  Tab(
                    icon: Icon(Ionicons.cube),
                    text: 'Past Questions',
                  ),
                ],
                isScrollable: true,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    LectureResourcePage(
                      lectureResource: widget.lectureResource,
                    ),
                    YoutubeResourcePage(
                      youtubeResource: widget.youtubeResource,
                    ),
                    QuestionResourcePage(
                      questionResource: widget.pastQuestion,
                    )
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

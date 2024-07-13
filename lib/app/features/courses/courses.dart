import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resource/app/features/courses/course_controller.dart';
import 'package:resource/app/features/courses/resourcepage.dart';
import 'package:resource/app/features/routes/routes.dart';
import 'package:resource/app/neumorphic.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CourseController controller = Get.put(CourseController());


  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Obx(() {
      String name = controller.isLoading.value ? '' : controller.programme;
      if (controller.isLoading.value) {
        return Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.blue,
            size: 90,
          ),
        );
      }
      if (controller.courses.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              name,
              style:  TextStyle(
                fontSize: screenwidth * 0.07,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.userdetails);
              },
              child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black45,
                    width: 2,
                    
                  )),
              child:  Icon(
                Icons.edit,
                size: screenwidth * 0.065,
              ),
              
            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade200,
          ),
          body: const Center(
            child: Text(
                'No courses available yet. Courses will be available soon'),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.isLoading.value ? '' : controller.programme,
            style:  TextStyle(
              fontSize: screenwidth * 0.07,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.userdetails);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black45,
                    width: 2,
                    
                  )),
              child:  Icon(
                Icons.edit,
                size: screenwidth * 0.065,
              ),
              
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade200,
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.courses.length,
            itemBuilder: (context, index) {
              var course = controller.courses[index];
              return NeumorphicContainer(
                onTap: () {
                  Get.to(
                    () => ResourcePage(
                      coursename: course['name'],
                      lectureResource: course['lectures'],
                      youtubeResource: course['youtube'],
                      pastQuestion: course['question'],
                    ),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.contain,
                        placeholder: (context, url) =>
                            LoadingAnimationWidget.dotsTriangle(
                          color: Colors.blue,
                          size: 30,
                        ),
                        imageUrl: course['image'],
                        width: screenwidth * 0.3,
                        height: screenwidth * 0.3,
                      ),
                      Text(course['name'],
                          style:  TextStyle(fontSize: screenwidth * 0.035)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}

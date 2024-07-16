import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resource/app/coursecard.dart';
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
      String sem = controller.isLoading.value ? '' : controller.semester;
      String year = controller.isLoading.value ? '' : controller.level;
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
          // appBar: AppBar(
          //   title: Text(
          //     name,
          //     style: TextStyle(
          //       fontSize: screenwidth * 0.07,
          //     ),
          //   ),
          //   leading: GestureDetector(
          //     onTap: () {
          //       Get.toNamed(AppRoutes.userdetails);
          //     },
          //     child: Container(
          //       margin: const EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(
          //             color: Colors.black45,
          //             width: 2,
          //           )),
          //       child: Icon(
          //         Icons.edit,
          //         size: screenwidth * 0.065,
          //       ),
          //     ),
          //   ),
          //   centerTitle: true,
          //   backgroundColor: Colors.blue.shade200,
          // ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                      "Welcome, ${controller.auth.currentUser!.displayName}",
                      style: GoogleFonts.ubuntu(
                          fontSize: 25, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    name,
                    style: GoogleFonts.ubuntu(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Level $year",
                    style: GoogleFonts.ubuntu(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Semester $sem",
                    style: GoogleFonts.ubuntu(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                        'No courses available yet. Courses will be available soon'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.userdetails);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    margin: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        'Menu',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // body: const Center(
          //   child: Text(
          //       'No courses available yet. Courses will be available soon'),
          // ),
        );
      }
      return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     controller.isLoading.value ? '' : controller.programme,
        //     style:  TextStyle(
        //       fontSize: screenwidth * 0.07,
        //     ),
        //   ),
        //   leading: GestureDetector(
        //     onTap: () {
        //       Get.toNamed(AppRoutes.userdetails);
        //     },
        //     child: Container(
        //       margin: const EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           border: Border.all(
        //             color: Colors.black45,
        //             width: 2,

        //           )),
        //       child:  Icon(
        //         Icons.edit,
        //         size: screenwidth * 0.065,
        //       ),

        //     ),
        //   ),
        //   centerTitle: true,
        //   backgroundColor: Colors.blue.shade200,
        // ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                    "Welcome, ${controller.auth.currentUser!.displayName}",
                    style: GoogleFonts.ubuntu(
                        fontSize: 25, fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  name,
                  style: GoogleFonts.ubuntu(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Level $year",
                  style: GoogleFonts.ubuntu(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Semester $sem",
                  style: GoogleFonts.ubuntu(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    var course = controller.courses[index];
                    return CourseCard(
                      imagePath: course['image'],
                      courseName: course['name'],
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
                    );
                  },
                  itemCount: controller.courses.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.userdetails);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      'Menu',
                      style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // body: SafeArea(
        //   child: GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       crossAxisSpacing: 10,
        //       mainAxisSpacing: 10,
        //     ),
        //     itemCount: controller.courses.length,
        //     itemBuilder: (context, index) {
        //       var course = controller.courses[index];
        //       return NeumorphicContainer(
        //         onTap: () {
        //           Get.to(
        //             () => ResourcePage(
        //               coursename: course['name'],
        //               lectureResource: course['lectures'],
        //               youtubeResource: course['youtube'],
        //               pastQuestion: course['question'],
        //             ),
        //           );
        //         },
        //         child: Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               CachedNetworkImage(
        //                 fit: BoxFit.contain,
        //                 placeholder: (context, url) =>
        //                     LoadingAnimationWidget.dotsTriangle(
        //                   color: Colors.blue,
        //                   size: 30,
        //                 ),
        //                 imageUrl: course['image'],
        //                 width: screenwidth * 0.3,
        //                 height: screenwidth * 0.3,
        //               ),
        //               Text(course['name'],
        //                   style:  TextStyle(fontSize: screenwidth * 0.035)),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      );
    });
  }
}

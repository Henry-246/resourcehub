import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resource/app/features/courses/download.dart';
import 'package:resource/app/features/courses/pdfpage.dart';

class LectureResourcePage extends StatefulWidget {
  final List lectureResource;
  const LectureResourcePage({
    super.key,
    required this.lectureResource,
  });

  @override
  State<LectureResourcePage> createState() => _LectureResourcePageState();
}

class _LectureResourcePageState extends State<LectureResourcePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.lectureResource.isEmpty
          ? const Center(
              child: Text('No resources available at the moment'),
            )
          : ListView.builder(
              itemCount: widget.lectureResource.length,
              itemBuilder: (context, index) {
                var lecture = widget.lectureResource[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          lecture['name'],
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                        leading: const Icon(Ionicons.document, size: 35),
                        onTap: () {
                          Get.to(
                            () => PdfPage(
                              name: lecture['name'],
                              link: lecture['link'],
                            ),
                          );
                          // Get.dialog(
                          //   AlertDialog(
                          //     title: const Text('Download or Open'),
                          //     content: SizedBox(
                          //       height: 100,
                          //       child: Column(
                          //         children: [
                          //           ElevatedButton(
                          //               onPressed: () async {
                          //                 Get.to(()=> DownloadPdfPage(url: lecture['link']));
                          //               },
                          //               child: const Text("Download")),
                          //           ElevatedButton(
                          //               onPressed: () {
                          //                 Get.to(() => PdfPage(
                          //                     name: lecture['name'],
                          //                     link: lecture['link']));
                          //               },
                          //               child: const Text("Open")),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                    // const Divider(
                    //   color: Colors.black38,
                    //   thickness: 2,
                    // )
                  ],
                );
              },
            ),
    );
  }
}

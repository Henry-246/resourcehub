import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/courses/pdfpage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
      body: ListView.builder(
        itemCount: widget.lectureResource.length,
        itemBuilder: (context, index) {
          var lecture = widget.lectureResource[index];
          return Column(
            children: [
              ListTile(
                title: Text(
                  lecture['name'],
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                leading: const Icon(Ionicons.document, size: 35),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('Download or Open'),
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text("Download")),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(() => PdfPage(
                                      name: lecture['name'],
                                      link: lecture['link']));
                                },
                                child: const Text("Open")),
                          ],
                        ),
                      ),
                     
                    ),
                  );
                },
              ),
              const Divider(
                color: Colors.black38,
                thickness: 2,
              )
            ],
          );
        },
      ),
    );
  }
}

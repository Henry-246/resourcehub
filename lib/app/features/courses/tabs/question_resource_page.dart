import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/courses/download.dart';
import 'package:resource/app/features/courses/pdfpage.dart';

class QuestionResourcePage extends StatefulWidget {
  final List questionResource;
  const QuestionResourcePage({super.key, required this.questionResource});

  @override
  State<QuestionResourcePage> createState() => _QuestionResourcePageState();
}

class _QuestionResourcePageState extends State<QuestionResourcePage> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:  widget.questionResource.isEmpty
          ? const Center(
              child: Text(
                'No resources available',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: widget.questionResource.length,
              itemBuilder: (context, index) {
                var question = widget.questionResource[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          question['name'],
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
                                      onPressed: () {
                                       Get.to(()=> DownloadPdfPage(url: question['link']));
                                      },
                                      child: const Text("Download"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => PdfPage(
                                            name: question['name'],
                                            link: question['link']));
                                      },
                                      child: const Text("Open"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
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

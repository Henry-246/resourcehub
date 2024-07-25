import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resource/app/features/ai/askaicontroller.dart';

class AskAiPage extends StatefulWidget {
  const AskAiPage({super.key});

  @override
  State<AskAiPage> createState() => _AskAiPageState();
}

class _AskAiPageState extends State<AskAiPage> {
  final AsKAiController controller = Get.put(AsKAiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Ask Ai'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.aiResponse.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(controller.userRequest[index],
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(controller.aiResponse[index],
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Obx(
            () => controller.hasImage.value != null
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: [
                              Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[300],
                                ),
                                child: Image.file(
                                  controller.fileImage ?? File(''),
                                  fit: BoxFit.cover,
                                  width: 50,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // Handle the close button tap event here
                                    print("hello");
                                    controller.clearFile(); // Example action
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors
                                          .red, // Background color for the close button
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors
                                          .white, // Color of the close icon
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  )
                : Container(),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller.promptController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Ask Ai anything..",
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Ionicons.camera),
                      onPressed: () {
                        controller.pickImage(ImageSource.camera);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Ionicons.image),
                      onPressed: () {
                        controller.pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
                suffixIcon: Obx(
                  () => IconButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.askAi,
                    icon: controller.isLoading.value
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.blue,
                            size: 40,
                          )
                        : const Icon(Ionicons.send),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

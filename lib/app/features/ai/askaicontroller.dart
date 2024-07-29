import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resource/keys.dart';

class AsKAiController extends GetxController {
  final TextEditingController promptController = TextEditingController();
  RxBool isLoading = false.obs;
  List aiResponse = [].obs;
  List userRequest = [].obs;
  final GetStorage _storage = GetStorage();
  final ScrollController scrollController = ScrollController();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? fileImage;

  var hasImage = Rxn<File>();

  @override
  void onInit() {
    loadItems();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void setFile(File? file) {
    hasImage.value = file;
  }

  // Method to clear the file
  void clearFile() {
    hasImage.value = null;
  }

  void askAi() async {
    try {
      isLoading.value = true;
      // userRequest.add(promptController.value.text);
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: Keys.apikey,
      );
      final prompt = promptController.text.trim();
      final chat = model.startChat(history: [
        Content.text(aiResponse.isNotEmpty ? aiResponse.last : ""),
        Content.model(
            [TextPart('Great to meet you. What would you like to know?')])
      ]);
      final imageBytes = await hasImage.value?.readAsBytes();
      GenerateContentResponse response;
      if (hasImage.value != null) {
        final content = [
          Content.multi(
            [TextPart(prompt), DataPart('image/jpeg', imageBytes!)],
          ),
        ];
        response = await model.generateContent(content);
        if (response.text!.isNotEmpty) {
          userRequest.add(promptController.value.text);
          aiResponse.add(response.text);
          scrollToBottom();
          saveResponses();
          promptController.clear();
          isLoading.value = false;
        }
        clearFile();
      } else {
        final content = Content.text(prompt);
        response = await chat.sendMessage(content);
        if (response.text!.isNotEmpty) {
          userRequest.add(promptController.value.text);
          aiResponse.add(response.text);
          scrollToBottom();
          saveResponses();
          promptController.clear();
          isLoading.value = false;
        }
      }

      // if (response.text!.isNotEmpty) {
      //   aiResponse.add(response.text);
      //   scrollToBottom();
      //   saveResponses();
      //   promptController.clear();
      //   isLoading.value = false;
      // }
    } catch (e) {
      Get.snackbar('Error', 'Try again');
      isLoading.value = false;
    }
  }

  void saveResponses() {
    _storage.write('response', aiResponse);
    _storage.write('userRequest', userRequest);
  }

  void loadItems() {
    List storedItems = _storage.read('response')?.cast<String>() ?? [];
    List storedUserRequest = _storage.read('userRequest')?.cast<String>() ?? [];
    aiResponse.addAll(storedItems);
    userRequest.addAll(storedUserRequest);
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300)).then(
      (_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      image = await picker.pickImage(source: source);
      if (image == null) return;
      final tmpImage = File(image!.path);
      fileImage = tmpImage;
      setFile(fileImage);
      Get.snackbar("Success", 'Image uploaded', backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image, make sure permission to access gallery is granted",
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      );
    }
  }
}

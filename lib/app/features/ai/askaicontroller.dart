import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:resource/keys.dart';

class AsKAiController extends GetxController {
  final TextEditingController promptController = TextEditingController();
  RxBool isLoading = false.obs;
  List aiResponse = [].obs;
  List userRequest = [].obs;
  final GetStorage _storage = GetStorage();
  final ScrollController scrollController = ScrollController();

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

  void askAi() async {
    try {
      isLoading.value = true;
      userRequest.add(promptController.value.text);
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: Keys.apikey,
      );

      final prompt = promptController.text;
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      if (response.text!.isNotEmpty) {
        aiResponse.add(response.text);
        scrollToBottom();
        saveResponses();
        promptController.clear();
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Try again');
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
}

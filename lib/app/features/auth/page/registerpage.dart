import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:resource/app/features/auth/controllers/auth_controller.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/illustration.png',
                      width: screenWidth * 0.6,
                      height: screenWidth * 0.6,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Create a New Account",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 450),
                        child: Text(
                          "Join Resource Hub and start your journey in successful academics. Fill in the details below to create your account.",
                          style: Get.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: controller.emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 500,
                            child: TextFormField(
                              controller: controller.usernameController,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 500,
                            child: Obx(
                              () => TextFormField(
                                controller: controller.passwordController,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.showPassword();
                                      },
                                      icon: controller.obscureText.value
                                          ? const Icon(Ionicons.eye_outline)
                                          : const Icon(
                                              Ionicons.eye_off_outline),
                                    )),
                                obscureText: controller.obscureText.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (value.length < 6) {
                                    return 'Password must be at least 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 500,
                            child: Obx(
                              () => TextFormField(
                                controller:
                                    controller.passwordConfirmController,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.showConfirmPassword();
                                    },
                                    icon: controller.obscureTextConfirm.value
                                        ? const Icon(Ionicons.eye_outline)
                                        : const Icon(Ionicons.eye_off_outline),
                                  ),
                                ),
                                obscureText:
                                    controller.obscureTextConfirm.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value !=
                                      controller.passwordController.text) {
                                    return 'Password is not the same';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 500,
                            height: 50,
                            child: Obx(
                              () => ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null
                                    : () {
                                        controller
                                            .registerWithEmailAndPassword();
                                      },
                                child: controller.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text("Register"),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: controller.navigateToAuth,
                            child:
                                const Text("Already have an account? Sign In"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

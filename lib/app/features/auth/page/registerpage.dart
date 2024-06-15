import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/app/features/auth/controllers/auth_controller.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/illustration.png'),
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
                          child: TextFormField(
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
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
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 500,
                          height: 50,
                          child: Obx(
                            () => ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () {
                                      controller.registerWithEmailAndPassword();
                                    },
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text("Register"),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: controller.navigateToAuth,
                          child: const Text("Already have an account? Sign In"),
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
    );
  }
}

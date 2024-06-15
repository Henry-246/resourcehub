import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource/app/features/auth/controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

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
                  Image.asset(
                    'assets/illustration.png',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome to Resource Hub",
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headlineMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 450,
                      ),
                      child: Text(
                        "Ready to commit to your studies? Don't waste any more time looking for the best resources. There's only one place you need to go, Resource Hub!",
                        style: Get.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 25,
                  //   ),
                  //   child: Obx(
                  //     () => ElevatedButton.icon(
                  //       onPressed: (){},
                  //       icon: controller.isLoading.value
                  //           ? const Spinner()
                  //           : const Icon(
                  //               Ionicons.logo_google,
                  //             ),
                  //       label: const Text("Continue with Google"),
                  //     ),
                  //   ),
                  // ),
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
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
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
                                      controller.signInWithEmailAndPassword();
                                    },
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text("Login"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: controller.navigateToRegister,
                          child: const Text("Don't have an account? Register"),
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

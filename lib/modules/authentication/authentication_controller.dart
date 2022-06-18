import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/services/_services.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class AuthenticationController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() async {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() async {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void navToSignIn() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    Get.toNamed(AppRoutes.auth + AppRoutes.login);
  }

  void navToSignUp() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    Get.toNamed(AppRoutes.auth + AppRoutes.register);
  }

  // TODO: Bad input handling and error handling
  Future<void> signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    bool status = await _provider.signIn(email, password);

    if (status) {
      Get.offNamed(AppRoutes.home);
    }
  }

  Future<void> signUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    bool status = await _provider.signUp(name, email, password);

    if (status) {
      Get.offNamed(AppRoutes.home);
    }
  }
}

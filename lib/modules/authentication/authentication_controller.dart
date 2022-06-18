import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/services/_services.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class AuthenticationController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  @override
  void onInit() async {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void onClose() async {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
  }

  void navToSignIn() {
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    Get.toNamed(AppRoutes.auth + AppRoutes.login);
  }

  void navToSignUp() {
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    Get.toNamed(AppRoutes.auth + AppRoutes.register);
  }

  Future<void> signIn() async {}

  Future<void> signUp() async {}
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/services/_services.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class FamilyController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  late TextEditingController codeController;
  late TextEditingController nameController;

  @override
  void onInit() async {
    super.onInit();
    codeController = TextEditingController();
    nameController = TextEditingController();
  }

  Future<Family> fetchFamily() async {
    return await _provider.fetchFamily();
  }

  void navToCreate() {
    codeController.clear();
    Get.toNamed(AppRoutes.family + AppRoutes.family_create);
  }

   void navToJoin() {
    nameController.clear();
    Get.toNamed(AppRoutes.family + AppRoutes.family_join);
  }

  Future<void> join() async {
  }

  Future<void> create() async {
  }
}

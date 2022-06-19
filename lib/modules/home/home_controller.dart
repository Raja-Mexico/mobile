import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/services/_services.dart';

class HomeController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  late TextEditingController familyCreateController;
  late TextEditingController familyJoinController;

  @override
  void onInit() async {
    super.onInit();
    familyCreateController = TextEditingController();
    familyJoinController = TextEditingController();
  }

  @override
  void onClose() async {
    super.onClose();
    familyCreateController.dispose();
    familyJoinController.dispose();
  }

  Future<User> fetchUser() async {
    return _provider.getUserBalanceDetails();
  }

  Future<ExpenseSummary> fetchExpenses() async {
    return await _provider.getUserExpenses();
  }
}

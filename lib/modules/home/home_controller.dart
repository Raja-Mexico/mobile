import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/services/_services.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  Future<ExpenseCategorySummary> fetchExpenses() async {
    return await _provider.getUserExpenses();
  }

  Future<void> openBrick() async {
    String url = await _provider.getBrickEndpoint();

    try {
      await launchUrlString(url);
    } catch (e) {
      throw Error();
    }
  }

  Future<void> signOut() async {
    GetStorage().remove('token');
    Get.offNamed(AppRoutes.auth);
  }
}

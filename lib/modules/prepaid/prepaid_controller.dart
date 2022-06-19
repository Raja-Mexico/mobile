import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/services/_services.dart';
import 'package:raja_mexico_app/utils/routes/app_pages.dart';

class PrepaidController extends GetxController {
  late int serviceId;
  late int balance;
  late String name;

  late TextEditingController dueDateController;
  late TextEditingController customerNumberController;
  late TextEditingController amountController;

  final ApiProvider _provider = Get.find<ApiProvider>();

  @override
  void onInit() async {
    User user = await _provider.getUserBalanceDetails();
    name = user.name!;
    balance = user.balance!;

    dueDateController = TextEditingController();
    customerNumberController = TextEditingController();
    amountController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    dueDateController.dispose();
    customerNumberController.dispose();
    amountController.dispose();
    super.onClose();
  }

  void navigateToSelectProduct() {
    Get.toNamed(AppRoutes.prepaid + AppRoutes.prepaidCreate);
  }

  void navigateToCreateForm(int serviceId) {
    this.serviceId = serviceId;
    Get.toNamed(AppRoutes.prepaid + AppRoutes.prepaidForm);
  }

  Future<void> savePrepaid() async {
    await _provider.savePrepaid(
      serviceId,
      int.parse(dueDateController.text),
      customerNumberController.text,
      int.parse(amountController.text),
    );

    dueDateController.clear();
    customerNumberController.clear();
    amountController.clear();

    Get.offNamed(AppRoutes.prepaid);
  }

// TODO: Send payment
  Future<void> payPrepaid() async {}

  Future<List<Prepaid>> fetchPrepaids() async {
    return await _provider.fetchPrepaids();
  }
}

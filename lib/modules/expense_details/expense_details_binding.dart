import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/expense_details/expense_details_controller.dart';

class ExpenseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ExpenseDetailsController());
  }
}

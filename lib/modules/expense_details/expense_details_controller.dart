import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/services/_services.dart';

class ExpenseDetailsController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  Future<User> fetchUser() async {
    return _provider.getUserBalanceDetails();
  }

  Future<List<Expense>> fetchExpenses() async {
    return await _provider.fetchFamilyExpenses();
  }
}

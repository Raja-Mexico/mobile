import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/services/_services.dart';

class FamilyController extends GetxController {
  final ApiProvider _provider = Get.find<ApiProvider>();

  Future<Family> fetchFamily() async {
    return await _provider.fetchFamily();
  }
}

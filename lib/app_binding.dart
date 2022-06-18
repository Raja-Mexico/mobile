import 'package:get/get.dart';
import 'package:raja_mexico_app/services/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider());
  }
}

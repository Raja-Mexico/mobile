import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/prepaid/prepaid_controller.dart';

class PrepaidBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrepaidController());
  }
}

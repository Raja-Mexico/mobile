import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/family/family_controller.dart';

class FamilyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FamilyController());
  }
}

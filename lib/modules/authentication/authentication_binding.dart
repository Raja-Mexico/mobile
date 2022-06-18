import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/authentication/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}

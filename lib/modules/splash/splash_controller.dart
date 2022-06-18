import 'package:get/get.dart';
// import 'package:raja_mexico_app/utils/device/sizing.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 2));

    // while (!Sizing.loaded()) {
    //   await Future.delayed(const Duration(seconds: 1));
    // }

    Get.offNamed(AppRoutes.home);
  }
}

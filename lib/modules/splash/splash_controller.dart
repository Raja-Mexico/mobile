import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class SplashController extends GetxController {
  final _storage = GetStorage();

  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 2));

    // while (!Sizing.loaded()) {
    //   await Future.delayed(const Duration(seconds: 1));
    // }

    if (_storage.read('token') == null) {
      Get.offNamed(AppRoutes.auth);
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }
}

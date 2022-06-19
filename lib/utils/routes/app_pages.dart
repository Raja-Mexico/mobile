import 'package:raja_mexico_app/modules/authentication/_authentication.dart';
import 'package:raja_mexico_app/modules/expense_details/_expense_details.dart';
import 'package:raja_mexico_app/modules/family/_family.dart';
import 'package:raja_mexico_app/modules/home/_home.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/splash/_splash.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
      children: [
        GetPage(
          name: AppRoutes.login,
          page: () => LoginView(),
        ),
        GetPage(
          name: AppRoutes.register,
          page: () => RegisterView(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.expense_details,
      page: () => ExpenseDetailsView(),
      binding: ExpenseDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.family,
      page: () => const FamilyView(),
      binding: FamilyBinding(),
    ),
  ];
}

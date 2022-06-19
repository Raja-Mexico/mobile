import 'package:raja_mexico_app/modules/authentication/_authentication.dart';
import 'package:raja_mexico_app/modules/expense_details/_expense_details.dart';
import 'package:raja_mexico_app/modules/family/_family.dart';
import 'package:raja_mexico_app/modules/family/views/family_create_view.dart';
import 'package:raja_mexico_app/modules/family/views/family_join_view.dart';
import 'package:raja_mexico_app/modules/home/_home.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/prepaid/_prepaid.dart';
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
      name: AppRoutes.expenseDetails,
      page: () => const ExpenseDetailsView(),
      binding: ExpenseDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.prepaid,
      page: () => const PrepaidView(),
      binding: PrepaidBinding(),
      children: [
        GetPage(
          name: AppRoutes.prepaidCreate,
          page: () => const PrepaidCreateView(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.family,
      page: () => FamilyView(),
      binding: FamilyBinding(),
      children: [
        GetPage(
          name: AppRoutes.family_join,
          page: () => FamilyJoinView(),
        ),
        GetPage(
          name: AppRoutes.family_create,
          page: () => FamilyCreateView(),
        ),
      ],
    ),
  ];
}

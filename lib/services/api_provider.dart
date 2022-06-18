import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raja_mexico_app/models/_models.dart';

class ApiProvider extends GetConnect {
  final _storage = GetStorage();
  final String _tokenKey = 'token';

  late String token;

  static const String _host = 'http://10.0.2.2:8080/api/';

  @override
  void onInit() async {
    token = _storage.read(_tokenKey) ?? '';

    httpClient.baseUrl = _host;
    httpClient.defaultContentType = 'application/json';

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });

    super.onInit();
  }

  Future<bool> signIn(String email, String password) async {
    var response = await post('login', {
      'email': email,
      'password': password,
    });

    if (response.body['token'] != null) {
      token = response.body['token'];
      _storage.write(_tokenKey, token);
      return true;
    }

    return false;
  }

  Future<bool> signUp(String name, String email, String password) async {
    var response = await post('register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.body['token'] != null) {
      token = response.body['token'];
      _storage.write(_tokenKey, token);
      return true;
    }

    return false;
  }

  // TODO: Implement
  Future<User> getUserBalanceDetails() async {
    // var response = await get('user/balance');

    await Future.delayed(const Duration(seconds: 2));

    return User(
      balance: 100000,
      name: 'Hendra',
      virtualAccountCode: 'CMRN190682',
    );
  }

  // TODO: Implement
  Future<ExpenseSummary> getUserExpenses() async {
    // var response = await get('brick/transaction');

    // if (response.body['error'] != null) {
    //   return ExpenseSummary();
    // }

    // return ExpenseSummary.fromJson(response.body);

    return ExpenseSummary(
      topExpenses: [
        Expense(
          categoryGroup: 'Cafe',
          total: 700,
        ),
        Expense(
          categoryGroup: 'Comida',
          total: 500,
        ),
        Expense(
          categoryGroup: 'Ropa',
          total: 300,
        ),
      ],
    );
  }
}

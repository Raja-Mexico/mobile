import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raja_mexico_app/models/_models.dart';

class ApiProvider extends GetConnect {
  final _storage = GetStorage();
  final String _tokenKey = 'token';

  late String token;

  static const String _host = 'https://05bf-180-252-172-19.ap.ngrok.io/api/';

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

  Future<User> getUserBalanceDetails() async {
    var response = await get('user-info');

    if (response.body['error'] != null) {
      return User();
    }

    return User.fromJson(response.body);
  }

  // TODO: Implement
  Future<ExpenseCategorySummary> getUserExpenses() async {
    var response = await get('brick/transaction');

    if (response.body['error'] != null) {
      return ExpenseCategorySummary();
    }

    return ExpenseCategorySummary.fromJson(response.body);
  }

  Future<String> getBrickEndpoint() async {
    var response = await get('brick/');
    return response.body;
  }

  Future<void> createFamily(String name) async {
    await post('team/', {
      'family_name': name,
    });
  }

  Future<void> joinFamily(String code) async {
    await post('team/join', {
      'family_code': code,
    });
  }

  Future<Family> fetchFamily() async {
    var response = await get('team/');

    if (response.body['error'] != null) {
      return Family();
    }

    return Family.fromJson(response.body);
  }

  Future<List<Expense>> fetchFamilyExpenses() async {
    var response = await get('team/expenses/');

    if (response.body['error'] != null) {
      return [];
    }

    return (response.body['Expenses'] as List)
        .map((e) => Expense.fromJson(e))
        .toList();
  }

  Future<List<Prepaid>> fetchPrepaids() async {
    var response = await get('prepaid/');
    return (response.body as List).map((e) => Prepaid.fromJson(e)).toList();
  }

  Future<void> savePrepaid(
      int serviceId, int dueDay, String customerNumber, int amount) async {
    await post('prepaid/', {
      'service_id': serviceId,
      'deadline_day': dueDay,
      'identity_number': customerNumber,
      'amount': amount,
    });
  }

  Future<void> payPrepaid(String code) async {}
}

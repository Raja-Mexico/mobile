import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';

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
}

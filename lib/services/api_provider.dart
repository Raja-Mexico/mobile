import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiProvider extends GetConnect {
  String _token = '';

  static const String _host = 'https://letshop-backend.herokuapp.com/api/';
  static const String _productPath = 'product/';

  @override
  void onInit() async {
    // _token = await FirebaseAuth.instance.currentUser?.getIdToken(true) ?? '';

    httpClient.baseUrl = _host;
    httpClient.defaultContentType = 'application/json';

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = 'Bearer $_token';
      return request;
    });

    super.onInit();
  }
}

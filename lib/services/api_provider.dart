import 'dart:convert';

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
    var response = await get('user-info');

    if (response.body['error'] != null) {
      return User();
    }

    return User.fromJson(response.body);
  }

  // TODO: Implement
  Future<ExpenseCategorySummary> getUserExpenses() async {
    // var response = await get('brick/transaction');

    // if (response.body['error'] != null) {
    //   return ExpenseSummary();
    // }

    // return ExpenseSummary.fromJson(response.body);

    return ExpenseCategorySummary(
      topExpenses: [
        ExpenseCategory(
          categoryGroup: 'Cafe',
          total: 700,
        ),
        ExpenseCategory(
          categoryGroup: 'Comida',
          total: 500,
        ),
        ExpenseCategory(
          categoryGroup: 'Ropa',
          total: 300,
        ),
      ],
    );
  }

  Future<String> getBrickEndpoint() async {
    var response = await get('brick/');
    return response.body;
  }

  Future<void> createFamily(String name) async {}

  Future<void> joinamily(String code) async {}

// TODO: ubah jadi body
  Future<Family> fetchFamily() async {
    // var response = await get('team');
    var response = jsonDecode('''
    {
      "family_name": "",
      "family_code": "HIYAHIYA",
      "family_balance": 150,
      "members": [
        {
          "name": "radit",
          "balance": 0,
          "is_admin": true,
          "is_sender": false
        },
        {
          "name": "roni",
          "balance": 100,
          "is_admin": false,
          "is_sender": false
        },
        {
          "name": "jajang",
          "balance": 0,
          "is_admin": false,
          "is_sender": false
        },
        {
          "name": "jeno",
          "balance": 50,
          "is_admin": false,
          "is_sender": true
        }
      ]
    }
    ''');

    if (response['error'] != null) {
      return Family();
    }

    return Family.fromJson(response);
  }

// TODO: ubah jadi body
  Future<List<Expense>> fetchFamilyExpenses() async {
    // var response = await get('brick/transaction');
    var response = jsonDecode('''
    {
    "Expenses": [
        {
            "spender": "ciaah",
            "desc": "TRSF E-BK CR 06/08 95031 TRF BRICK TO TAUF",
            "date": "2021-08-28",
            "category": "Shopping",
            "amount": 10000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-06-23",
            "category": "auto & transport",
            "amount": 13000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-06-23",
            "category": "utility bills",
            "amount": 30000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-06-28",
            "category": "auto & transport",
            "amount": 12000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-07-28",
            "category": "utility bills",
            "amount": 10000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-07-31",
            "category": "utility bills",
            "amount": 15000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-01",
            "category": "utility bills",
            "amount": 10000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-03",
            "category": "utility bills",
            "amount": 15000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-06",
            "category": "utility bills",
            "amount": 20000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-08",
            "category": "utility bills",
            "amount": 25000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-10",
            "category": "other bills",
            "amount": 9000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-10",
            "category": "other bills",
            "amount": 5500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-10",
            "category": "other bills",
            "amount": 5500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-14",
            "category": "utility bills",
            "amount": 25000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-20",
            "category": "utility bills",
            "amount": 50000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-08-21",
            "category": "food & dining",
            "amount": 127000
        },
        {
            "spender": "Raditya",
            "desc": "Pembayaran Tip F-1346435453",
            "date": "2021-08-21",
            "category": "account transfer-out",
            "amount": 5000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-08-21",
            "category": "food & dining",
            "amount": 106000
        },
        {
            "spender": "Raditya",
            "desc": "Pembayaran Tip F-1346491464",
            "date": "2021-08-23",
            "category": "account transfer-out",
            "amount": 5000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-24",
            "category": "other bills",
            "amount": 10000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-08-25",
            "category": "food & dining",
            "amount": 121000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-08-26",
            "category": "utility bills",
            "amount": 20000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-08-26",
            "category": "food & dining",
            "amount": 125980
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-08-26",
            "category": "food & dining",
            "amount": 61000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-08-27",
            "category": "food & dining",
            "amount": 143211
        },
        {
            "spender": "Raditya",
            "desc": "GoPulsa - SIMPATI 20.000 - 081299436712",
            "date": "2021-08-27",
            "category": "utility bills",
            "amount": 21500
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-09-06",
            "category": "auto & transport",
            "amount": 8000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-09-09",
            "category": "food & dining",
            "amount": 112710
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-09-10",
            "category": "auto & transport",
            "amount": 8000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-09-10",
            "category": "utility bills",
            "amount": 15000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Transfer to nathasya e",
            "date": "2021-09-20",
            "category": "account transfer-out",
            "amount": 7500
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-09-20",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-09-22",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-09-24",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-09-25",
            "category": "utility bills",
            "amount": 50000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-10-06",
            "category": "food & dining",
            "amount": 42400
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-10-06",
            "category": "auto & transport",
            "amount": 14000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-10-08",
            "category": "auto & transport",
            "amount": 14000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-10-18",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-10-18",
            "category": "utility bills",
            "amount": 2900
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-10-20",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-10-21",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-10-24",
            "category": "utility bills",
            "amount": 3000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-10-28",
            "category": "food & dining",
            "amount": 117212
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-10-29",
            "category": "utility bills",
            "amount": 3000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-10-29",
            "category": "auto & transport",
            "amount": 9000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-10-30",
            "category": "auto & transport",
            "amount": 9000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-11-01",
            "category": "food & dining",
            "amount": 79000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-11-01",
            "category": "food & dining",
            "amount": 94200
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-01",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-01",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-02",
            "category": "utility bills",
            "amount": 14200
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-03",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-06",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-08",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-10",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-12",
            "category": "auto & transport",
            "amount": 7000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-14",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-15",
            "category": "auto & transport",
            "amount": 14000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2021-11-17",
            "category": "auto & transport",
            "amount": 14000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-25",
            "category": "utility bills",
            "amount": 14200
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-11-26",
            "category": "food & dining",
            "amount": 29000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD PICKUP",
            "date": "2021-11-26",
            "category": "food & dining",
            "amount": 35000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-26",
            "category": "utility bills",
            "amount": 13000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-11-29",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-12-01",
            "category": "food & dining",
            "amount": 59000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-12-01",
            "category": "food & dining",
            "amount": 56000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-12-04",
            "category": "utility bills",
            "amount": 3000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-12-06",
            "category": "food & dining",
            "amount": 117212
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-12-08",
            "category": "food & dining",
            "amount": 85000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-12-12",
            "category": "food & dining",
            "amount": 79210
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2021-12-15",
            "category": "food & dining",
            "amount": 74000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-12-25",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2021-12-29",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-01-03",
            "category": "food & dining",
            "amount": 74000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-01-04",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-01-05",
            "category": "utility bills",
            "amount": 3500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-01-06",
            "category": "utility bills",
            "amount": 21000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Transfer to Fiqar Aditya",
            "date": "2022-01-09",
            "category": "account transfer-out",
            "amount": 32000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-01-10",
            "category": "other bills",
            "amount": 9000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Transfer to Dwi Amira Ramadhanti",
            "date": "2022-01-13",
            "category": "account transfer-out",
            "amount": 102000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-01-18",
            "category": "other bills",
            "amount": 23000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-01-26",
            "category": "food & dining",
            "amount": 64000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Transfer to Indy",
            "date": "2022-01-30",
            "category": "account transfer-out",
            "amount": 15000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2022-02-09",
            "category": "auto & transport",
            "amount": 14000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-02-14",
            "category": "food & dining",
            "amount": 98500
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-02-15",
            "category": "utility bills",
            "amount": 12000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-02-16",
            "category": "utility bills",
            "amount": 30000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Transfer to Indy",
            "date": "2022-02-19",
            "category": "account transfer-out",
            "amount": 15000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-03-11",
            "category": "utility bills",
            "amount": 3800
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-03-17",
            "category": "shopping",
            "amount": 30210
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-03-19",
            "category": "food & dining",
            "amount": 38000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-03-25",
            "category": "food & dining",
            "amount": 67000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-03-25",
            "category": "food & dining",
            "amount": 86000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-03-25",
            "category": "food & dining",
            "amount": 134400
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-03-29",
            "category": "food & dining",
            "amount": 51980
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-03-31",
            "category": "food & dining",
            "amount": 23990
        },
        {
            "spender": "Raditya",
            "desc": "Pembayaran Tip F-1643213604",
            "date": "2022-04-02",
            "category": "account transfer-out",
            "amount": 5000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-04-02",
            "category": "food & dining",
            "amount": 306800
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-04-02",
            "category": "utility bills",
            "amount": 54000
        },
        {
            "spender": "Raditya",
            "desc": "GO-RIDE",
            "date": "2022-04-10",
            "category": "auto & transport",
            "amount": 15000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-04-13",
            "category": "food & dining",
            "amount": 22390
        },
        {
            "spender": "Radotya",
            "desc": "GO-FOOD",
            "date": "2022-04-14",
            "category": "food & dining",
            "amount": 74000
        },
        {
            "spender": "Raditya",
            "desc": "GO-FOOD",
            "date": "2022-04-19",
            "category": "food & dining",
            "amount": 73000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-04-20",
            "category": "shopping",
            "amount": 10078
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-04-23",
            "category": "utility bills",
            "amount": 10000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-05-01",
            "category": "utility bills",
            "amount": 54000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment #Bumble #ATxcID",
            "date": "2022-05-05",
            "category": "other bills",
            "amount": 132090
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-05-07",
            "category": "other bills",
            "amount": 17000
        },
        {
            "spender": "Raditya",
            "desc": "GO-PAY Payment",
            "date": "2022-06-03",
            "category": "utility bills",
            "amount": 54000
        }
    ]
}
''');

    if (response['error'] != null) {
      return [];
    }

    return (response['Expenses'] as List)
        .map((e) => Expense.fromJson(e))
        .toList();
  }
}

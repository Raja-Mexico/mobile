class User {
  String? name;
  int? balance;
  String? virtualAccountCode;
  bool? isInFamily;

  User({
    this.name,
    this.balance,
    this.virtualAccountCode,
    this.isInFamily,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      balance: json['balance'] as int,
      virtualAccountCode: json['virtual_account_code'] as String,
      isInFamily: json['is_in_family'] as bool,
    );
  }
}

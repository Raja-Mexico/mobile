class FamilyMember {
  String? name;
  int? balance;
  bool? isAdmin;
  bool? isSender;

  FamilyMember({
    this.name,
    this.balance,
    this.isAdmin,
    this.isSender,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      name: json['name'] as String,
      balance: json['balance'] as int,
      isAdmin: json['is_admin'] as bool,
      isSender: json['is_sender'] as bool,
    );
  }
}

class Family {
  String? name;
  String? code;
  int? balance;
  List<FamilyMember>? members;

  Family({
    this.name,
    this.code,
    this.balance,
    this.members,
  });

  factory Family.fromJson(Map<String, dynamic> json) {
    var membersJson = json['members'] as List;
    return Family(
      name: json['family_name'] as String,
      code: json['family_code'] as String,
      balance: json['family_balance'] as int,
      members: membersJson
          .map((memberJson) => FamilyMember.fromJson(memberJson))
          .toList(),
    );
  }
}

class Prepaid {
  String? title;
  int? category;
  int? status;
  int? dueDays;
  int? amount;

  Prepaid({
    this.title,
    this.category,
    this.status,
    this.dueDays,
    this.amount,
  });

  factory Prepaid.fromJson(Map<String, dynamic> json) {
    return Prepaid(
      title: json['title'] as String,
      category: json['category'] as int,
      status: json['status'] as int,
      dueDays: json['due_in_days'] as int,
      amount: json['amount'] as int,
    );
  }
}

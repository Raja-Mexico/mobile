class Prepaid {
  int? id;
  String? title;
  int? category;
  int? status;
  int? dueDays;
  int? amount;

  Prepaid({
    this.id,
    this.title,
    this.category,
    this.status,
    this.dueDays,
    this.amount,
  });

  factory Prepaid.fromJson(Map<String, dynamic> json) {
    return Prepaid(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['service_id'] as int,
      status: json['status_id'] as int,
      dueDays: json['due_in_days'] as int,
      amount: json['amount'] as int,
    );
  }
}

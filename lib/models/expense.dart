class Expense {
  String? categoryGroup;
  int? total;
  double? percentage;

  Expense({
    this.categoryGroup,
    this.total,
    this.percentage,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      categoryGroup: json['name'] as String,
      total: json['total_expense'] as int,
      percentage: double.parse(json['percentage']),
    );
  }
}

class ExpenseSummary {
  List<Expense>? expenses;
  List<Expense>? topExpenses;

  ExpenseSummary({
    this.expenses,
    this.topExpenses,
  });

  factory ExpenseSummary.fromJson(Map<String, dynamic> json) {
    var expensesJson = json['expenses'] as List;
    var topExpensesJson = json['top_expenses'] as List;

    List<Expense> expenses = expensesJson
        .map((expenseJson) => Expense.fromJson(expenseJson))
        .toList();
    List<Expense> topExpenses = topExpensesJson
        .map((expenseJson) => Expense.fromJson(expenseJson))
        .toList();

    return ExpenseSummary(expenses: expenses, topExpenses: topExpenses);
  }
}

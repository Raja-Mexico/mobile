class Expense {
  String? spender;
  String? desc;
  DateTime? date;
  String? category;
  int? amount;

  Expense({
    this.spender,
    this.desc,
    this.date,
    this.category,
    this.amount,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      spender: json['spender'] as String,
      desc: json['desc'] as String,
      date: DateTime.parse(json['date']),
      category: json['category'] as String,
      amount: json['amount'] as int,
    );
  }
}

class ExpenseCategory {
  String? categoryGroup;
  int? total;
  double? percentage;

  ExpenseCategory({
    this.categoryGroup,
    this.total,
    this.percentage,
  });

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) {
    return ExpenseCategory(
      categoryGroup: json['name'] as String,
      total: json['total_expense'] as int,
      percentage: double.parse(json['percentage']),
    );
  }
}

class ExpenseCategorySummary {
  List<ExpenseCategory>? expenses;
  List<ExpenseCategory>? topExpenses;

  ExpenseCategorySummary({
    this.expenses,
    this.topExpenses,
  });

  factory ExpenseCategorySummary.fromJson(Map<String, dynamic> json) {
    var expensesJson = json['expenses'] as List;
    var topExpensesJson = json['top_expenses'] as List;

    List<ExpenseCategory> expenses = expensesJson
        .map((expenseJson) => ExpenseCategory.fromJson(expenseJson))
        .toList();
    List<ExpenseCategory> topExpenses = topExpensesJson
        .map((expenseJson) => ExpenseCategory.fromJson(expenseJson))
        .toList();

    return ExpenseCategorySummary(expenses: expenses, topExpenses: topExpenses);
  }
}

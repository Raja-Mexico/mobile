import 'package:flutter/material.dart';
import 'package:raja_mexico_app/models/expense.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';

class TopExpensesChart extends StatelessWidget {
  final double barHeight;
  final double barWidth;
  final double barSpace;
  final double mainFontSize;
  final double descFontSize;
  final List<Expense> topExpenses;

  const TopExpensesChart({
    Key? key,
    this.barHeight = 128,
    this.barWidth = 32,
    this.barSpace = 24,
    this.mainFontSize = 10,
    this.descFontSize = 10,
    required this.topExpenses,
  }) : super(key: key);

  Widget _buildExpenseBar(Expense expense, int maxExpense) {
    var height = barHeight * expense.total! / maxExpense;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: barHeight - height,
          width: barWidth,
        ),
        Container(
          height: height,
          color: AppColor.primary,
          width: barWidth,
        ),
        StyledText(
          text: expense.categoryGroup!,
          color: AppColor.black,
          fontSize: mainFontSize,
          fontWeight: FontWeight.bold,
        ),
        StyledText(
          text: expense.total!.toString(),
          color: AppColor.black,
          fontSize: descFontSize,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int maxExpense = topExpenses[0].total!;

    return Row(
      children: [
        for (Expense expense in topExpenses) ...[
          SizedBox(width: barSpace / 2),
          _buildExpenseBar(expense, maxExpense),
          SizedBox(width: barSpace / 2),
        ],
      ],
    );
  }
}

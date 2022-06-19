import 'package:flutter/material.dart';
import 'package:raja_mexico_app/models/expense.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';
import 'package:raja_mexico_app/utils/helpers/_helpers.dart';

class TopExpensesChart extends StatelessWidget {
  final double barHeight;
  final double barWidth;
  final double barSpace;
  final double mainFontSize;
  final double descFontSize;
  final List<ExpenseCategory> topExpenses;

  const TopExpensesChart({
    Key? key,
    this.barHeight = 128,
    this.barWidth = 24,
    this.barSpace = 8,
    this.mainFontSize = 10,
    this.descFontSize = 10,
    required this.topExpenses,
  }) : super(key: key);

  Widget _buildExpenseBar(ExpenseCategory expense, int maxExpense) {
    var height = barHeight * expense.total! / maxExpense;

    return SizedBox(
      width: 48,
      child: Column(
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
          FittedBox(
            fit: BoxFit.fitWidth,
            child: StyledText(
              text: expense.categoryGroup!,
              color: AppColor.black,
              fontSize: mainFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: StyledText(
              text: currencyFormat(expense.total!),
              color: AppColor.black,
              fontSize: descFontSize,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int maxExpense = topExpenses[0].total!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (ExpenseCategory expense in topExpenses) ...[
          SizedBox(width: barSpace / 2),
          _buildExpenseBar(expense, maxExpense),
          SizedBox(width: barSpace / 2),
        ],
      ],
    );
  }
}
